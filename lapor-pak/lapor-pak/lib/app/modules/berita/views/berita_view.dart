import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:lapor_pak/app/routes/app_pages.dart';
import 'dart:convert';
import '../controllers/berita_controller.dart';
import 'package:flutter/services.dart';

class BeritaView extends GetView<BeritaController> {
  const BeritaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text("News",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.newsStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView(
              shrinkWrap: true,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                Timestamp t = data['timestamp'];
                DateTime d = t.toDate();
                var formatter = DateFormat('dd MMM yyyy HH:mm');
                var newsDate = formatter.format(d);
                Uint8List _bytesImage;
                String _imgString = data['foto'];
                _bytesImage = Base64Decoder().convert(_imgString);
                return Container(
                    margin: EdgeInsets.only(right: 15, left: 15, bottom: 15),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 9,
                              offset: Offset(0, 6) // changes position of shadow
                              ),
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.BERITA_DETAIL,
                              arguments: {'id': document.id});
                        },
                        child: Row(children: [
                          Container(
                            height: 80,
                            width: 80,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.memory(
                                _bytesImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                newsDate.toString(),
                                style: TextStyle(fontSize: 10),
                              ),
                              SizedBox(height: 7),
                              Container(
                                  width: Get.width * .5,
                                  child: Text(
                                    data['judul'],
                                    maxLines: 2,
                                    style: TextStyle(fontSize: 15),
                                  ))
                            ],
                          )
                        ])));
              }).toList());
        },
      ),
    );
  }
}
