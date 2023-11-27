import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';
import '../controllers/berita_detail_controller.dart';
import 'package:intl/intl.dart';

class BeritaDetailView extends GetView<BeritaDetailController> {
  const BeritaDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<DocumentSnapshot<Object?>>(
            future: controller.getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              var data = snapshot.data!.data() as Map<String, dynamic>;

              Uint8List _bytesImage;
              String _imgString = data['foto'];
              _bytesImage = Base64Decoder().convert(_imgString);

              Timestamp t = data['timestamp'];
              DateTime d = t.toDate();
              var formatter = DateFormat('dd MMM yyyy HH:mm');
              var newsDate = formatter.format(d);

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      height: Get.height * .3,
                      decoration: BoxDecoration(color: Colors.grey[300]),
                      child: Image.memory(
                        _bytesImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      size: 12,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(newsDate.toString())
                                  ],
                                ),
                                SizedBox(height: 7),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.newspaper,
                                      size: 12,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(data['sumber'])
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 30),
                            Container(
                                child: Text(
                              data['isi'],
                              style: TextStyle(fontSize: 16, height: 1.5),
                            )),
                          ]),
                    )
                  ],
                ),
              );
            }));
  }
}
