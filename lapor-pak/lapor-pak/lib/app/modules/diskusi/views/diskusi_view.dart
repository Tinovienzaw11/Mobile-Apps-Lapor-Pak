import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:lapor_pak/app/routes/app_pages.dart';
import 'package:flutter/services.dart';
import '../controllers/diskusi_controller.dart';
import 'package:intl/intl.dart';

class DiskusiView extends GetView<DiskusiController> {
  DiskusiView({Key? key}) : super(key: key);
  DiskusiController controller = Get.put(DiskusiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DIMAS"),
        elevation: 0,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xff1A669D),
        onPressed: () {
          Get.toNamed(Routes.DISKUSI_CREATE);
        },
        label: Text(
          'DISKUSI',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        icon: Icon(Icons.add_comment_outlined),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.laporanStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
              Uint8List _bytesImage;
              String _imgString = data['foto'];
              _bytesImage = Base64Decoder().convert(_imgString);
              Timestamp t = data['timestamp'];
              DateTime d = t.toDate();
              var formatter = DateFormat('dd MMM yyyy HH:mm');
              var diskusiDate = formatter.format(d);
              return Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 25),
                  width: Get.width,
                  // height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 9,
                          offset: Offset(0, 6) // changes position of shadow
                          ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          height: 180,
                          width: Get.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0),
                            ),
                            child: data['foto'] != ''
                                ? Image.memory(
                                    _bytesImage,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    'assets/diskusi.jpeg',
                                    fit: BoxFit.cover,
                                  ),
                          )),
                      Container(
                          width: Get.width,
                          height: 90,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0),
                              )),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.DISKUSI_DETAIL, arguments: {
                                'id': document.id,
                                'isi': data['isi'],
                                'penulis': data['penulis'],
                                'judul': data['judul'],
                                'foto': data['foto']
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      diskusiDate.toString(),
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.black87),
                                    ),
                                    Text(
                                      data['penulis'],
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.black87),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  data['kategori'],
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  data['judul'],
                                  maxLines: 2,
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                          )),
                    ],
                  ));
            }).toList(),
          );
        },
      ),
    );
  }
}
