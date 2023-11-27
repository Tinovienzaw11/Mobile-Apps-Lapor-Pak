import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:lapor_pak/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    List<String> myList = [
      "disdukcapil",
      "pelaporan",
      "dimas",
      "news",
      "ktp",
      "berita"
    ];
    return Scaffold(
        body: StreamBuilder<DocumentSnapshot<Object?>>(
            stream: controller.getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              var data = snapshot.data!.data() as Map<String, dynamic>;
              controller.saveState(data["nama"]);
              Uint8List _bytesImage;
              String _imgString = data['foto'];
              _bytesImage = Base64Decoder().convert(_imgString);

              return SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(height: Get.width * .1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("LAPOR PAK!",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400)),
                            Text(data["nama"],
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w700))
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.USER_PROFILE);
                          },
                          child: ClipOval(
                            child: data['foto'] != ''
                                ? Image.memory(
                                    _bytesImage,
                                    fit: BoxFit.cover,
                                    width: 70, // Set the width of the image
                                    height: 70, // Set the height of the image
                                  )
                                : Image.asset('assets/profile.png',
                                    fit: BoxFit.cover,
                                    width: 70, // Set the width of the image
                                    height: 70),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    // Container(
                    //   width: Get.width,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(30.0),
                    //     color: Color(0xffEEF6FC),
                    //   ),
                    //   child: TextField(
                    //     // onChanged: (value) {
                    //     //   showModalBottomSheet(
                    //     //     context: context,
                    //     //     builder: (BuildContext context) {
                    //     //       return Container(
                    //     //         // Add your widget content here
                    //     //         child: Text('Modal Bottom Sheet'),
                    //     //       );
                    //     //     },
                    //     //   );
                    //     // },
                    //     controller: controller.searchC,
                    //     decoration: InputDecoration(
                    //       prefixIcon: Icon(Icons.search),
                    //       suffixIcon: Icon(Icons.tune),
                    //       labelStyle: TextStyle(fontSize: 13.0),
                    //       hintStyle: TextStyle(fontSize: 11.0),
                    //       border: InputBorder.none,
                    //       hintText: 'Cari info layanan',
                    //       contentPadding: EdgeInsets.symmetric(
                    //           horizontal: 18.0, vertical: 16.0),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 40),
                    Container(
                        width: Get.width,
                        child: Text(
                          "Info Layanan",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 80,
                            // height: 80,
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.DISDUKCAPIL);
                              },
                              child: Column(
                                children: [
                                  Image.asset('assets/dukcapil.png'),
                                  SizedBox(height: 8),
                                  Text(
                                    "DISDUKCAPIL",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            )),
                        Container(
                            width: 80,
                            // height: 80,
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.PELAPORAN);
                              },
                              child: Column(
                                children: [
                                  Image.asset('assets/pelaporan.png'),
                                  SizedBox(height: 8),
                                  Text(
                                    "PELAPORAN",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            )),
                        Container(
                            width: 80,
                            // height: 80,
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.DISKUSI);
                              },
                              child: Column(
                                children: [
                                  Image.asset('assets/dimas.png'),
                                  SizedBox(height: 8),
                                  Text(
                                    "DIMAS",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            )),
                        Container(
                            width: 80,
                            // height: 80,
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.BERITA);
                              },
                              child: Column(
                                children: [
                                  Image.asset('assets/news.png'),
                                  SizedBox(height: 8),
                                  Text(
                                    "NEWS",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: 40),
                    Container(
                        width: Get.width,
                        child: Text(
                          "Antrian DisdukCapil",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      height: 150.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            width: 330.0,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                                color: Color(0xff1A669D),
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 80,
                                  margin: EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "20",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 30,
                                            color: Colors.white),
                                      ),
                                      Text("Antrian",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17,
                                              color: Colors.white))
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Antrian Saat Ini",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: Colors.white)),
                                      SizedBox(height: 10),
                                      Text("Layanan KTP-EL",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                              color: Colors.white)),
                                      SizedBox(height: 10),
                                      Text("Antrian Tutup Sabtu/Minggu",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14,
                                              color: Colors.white))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 330.0,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                                color: Color(0xffE09F1F).withOpacity(.14),
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 80,
                                  margin: EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                      color: Color(0xffE09F1F),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "12",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 30,
                                            color: Colors.white),
                                      ),
                                      Text("Antrian",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17,
                                              color: Colors.white))
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Antrian Saat Ini",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: Colors.black)),
                                      SizedBox(height: 10),
                                      Text("Konsultasi dan KIA",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                              color: Colors.black)),
                                      SizedBox(height: 10),
                                      Text("Antrian Tutup Sabtu/Minggu",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14,
                                              color: Colors.black))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: 40),

                    StreamBuilder<DocumentSnapshot<Object?>>(
                        stream: controller.ktpUpdate(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }

                          if (snapshot.data!.data() != null) {
                            var data =
                                snapshot.data!.data() as Map<String, dynamic>;

                            return Column(
                              children: [
                                Container(
                                    width: Get.width,
                                    child: Text(
                                      "Update Info E-KTP  ",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )),
                                SizedBox(height: 20),
                                Container(
                                  width: Get.width,
                                  // height: 100,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 3,
                                            blurRadius: 9,
                                            offset: Offset(0,
                                                6) // changes position of shadow
                                            ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Padding(
                                      padding: EdgeInsets.all(26),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Status pembuatan KTP-EL Anda",
                                              style: TextStyle(
                                                  fontSize: 20, height: 1.6)),
                                          SizedBox(height: 17),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.work_history_outlined,
                                                color:
                                                    data['status'] == 'Selesai'
                                                        ? Colors.green[600]
                                                        : Colors.black54,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                data['status'],
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: data['status'] ==
                                                            'Selesai'
                                                        ? Colors.green[600]
                                                        : Colors.black54,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          )
                                        ],
                                      )),
                                ),
                              ],
                            );
                          } else {
                            return SizedBox();
                          }
                        }),

                    SizedBox(height: 30),
                  ],
                ),
              ));
            }),
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
