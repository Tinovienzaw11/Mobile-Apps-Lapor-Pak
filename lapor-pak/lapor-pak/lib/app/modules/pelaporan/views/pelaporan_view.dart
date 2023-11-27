import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:lapor_pak/app/routes/app_pages.dart';

import '../controllers/pelaporan_controller.dart';

class PelaporanView extends GetView<PelaporanController> {
  PelaporanView({Key? key}) : super(key: key);
  PelaporanController controller = Get.put(PelaporanController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pelaporan"),
          elevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700),
          automaticallyImplyLeading: false,
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color(0xff1A669D),
          onPressed: () {
            Get.toNamed(Routes.BUAT_LAPORAN);
          },
          label: Text(
            'LAPOR!',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          icon: Icon(Icons.campaign),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: controller.laporanStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                            child: Image.memory(
                              _bytesImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
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
                                Get.toNamed(Routes.DETAIL_LAPORAN,
                                    arguments: {'id': document.id});
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
                                        data['tgl_lapor'],
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.black87),
                                      ),
                                      Text(
                                        data['nama_pelapor'],
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    data['keterangan'],
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
        bottomNavigationBar: ConvexAppBar(
          initialActiveIndex: 2,
          backgroundColor: Color(0xff1A669D),
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.help_center, title: 'Bantuan'),
            TabItem(icon: Icons.campaign, title: 'Lapor'),
            TabItem(icon: Icons.phone, title: 'Kontak'),
            TabItem(icon: Icons.notifications, title: 'Notifikasi'),
          ],
          onTap: (int i) {
            print('click index=$i');
            if (i == 0) {
              Get.toNamed(Routes.HOME);
            } else if (i == 1) {
              Get.toNamed(Routes.BANTUAN);
            } else if (i == 2) {
              Get.toNamed(Routes.PELAPORAN);
            } else if (i == 3) {
              Get.toNamed(Routes.KONTAK);
            } else if (i == 4) {
              Get.toNamed(Routes.NOTIFIKASI);
            }
          },
        ));
  }
}
