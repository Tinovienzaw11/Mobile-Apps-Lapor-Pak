import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'dart:convert';
import '../controllers/diskusi_detail_controller.dart';
import 'package:flutter/services.dart';

class DiskusiDetailView extends GetView<DiskusiDetailController> {
  DiskusiDetailView({Key? key}) : super(key: key);
  DiskusiDetailController controller = Get.put(DiskusiDetailController());

  @override
  Widget build(BuildContext context) {
    Uint8List _bytesImage;
    String _imgString = controller.arguments['foto'];
    _bytesImage = Base64Decoder().convert(_imgString);
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color(0xff1A669D),
          onPressed: () {
            Get.dialog(
              AlertDialog(
                title: Text('Tanggapan Anda'),
                content: Container(
                  width: Get.width,
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: controller.tanggapanC,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 13.0),
                      hintStyle: TextStyle(fontSize: 11.0),
                      border: InputBorder.none,
                      hintText: 'Isi tanggapan Anda',
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Batal'),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.saveComment();
                    },
                    child: Text('Simpan'),
                  ),
                ],
              ),
            );
          },
          label: Text(
            'TANGGAPI',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          icon: Icon(Icons.add_comment_outlined),
        ),
        body: Column(
          children: [
            Container(
              height: Get.height / 4,
              width: Get.width,
              child: ClipRRect(
                // borderRadius: BorderRadius.circular(15),
                child: controller.arguments['foto'] != ''
                    ? Image.memory(
                        _bytesImage,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/diskusi.jpeg',
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Container(
              width: Get.width,
              margin: EdgeInsets.only(right: 15, left: 15, bottom: 15, top: 20),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.arguments['judul'],
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 10),
                  Text(controller.arguments['isi'])
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20, right: 15, left: 15),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tanggapan",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: controller.getDiscussionStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            ),
                            SizedBox(height: 10),
                            Text('Terjadi kesalahan.')
                          ]),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  var countData = snapshot.data!.size;
                  return countData > 0
                      ? ListView(
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;
                            Timestamp t = data['timestamp'];
                            DateTime d = t.toDate();
                            var formatter = DateFormat('dd MMM yyyy HH:mm');
                            var newsDate = formatter.format(d);

                            return Container(
                                margin: EdgeInsets.only(
                                    right: 15, left: 15, bottom: 15),
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 3,
                                          blurRadius: 9,
                                          offset: Offset(0,
                                              6) // changes position of shadow
                                          ),
                                    ],
                                    borderRadius: BorderRadius.circular(15)),
                                child: InkWell(
                                    onTap: () {},
                                    child: Row(children: [
                                      Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: Colors.blue[50],
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.person_rounded,
                                                size: 40,
                                                color: Colors.black26,
                                              ),
                                              Text(
                                                data['nama'],
                                                maxLines: 1,
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            newsDate.toString(),
                                            style: TextStyle(fontSize: 10),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                              width: Get.width * .5,
                                              child: Text(
                                                data['balasan'],
                                                // maxLines: 2,
                                                style: TextStyle(fontSize: 15),
                                              )),
                                        ],
                                      )
                                    ])));
                          }).toList())
                      : Center(
                          child: Text("Belum ada tanggapan"),
                        );
                },
              ),
            )
          ],
        ));
  }
}
