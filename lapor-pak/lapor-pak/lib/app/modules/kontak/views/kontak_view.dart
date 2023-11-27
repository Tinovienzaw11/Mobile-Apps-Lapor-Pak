import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lapor_pak/app/routes/app_pages.dart';

import '../controllers/kontak_controller.dart';

class KontakView extends GetView<KontakController> {
  const KontakView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: Get.width,
                margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: Text(
                  "Kontak",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                ),
              ),
              Container(
                width: Get.width,
                height: 100,
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 9,
                        offset: Offset(0, 6) // changes position of shadow
                        ),
                  ],
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        "assets/pemda.png",
                        // width: 100,
                        // height: 100,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lapor Pemda",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: 5),
                        Text("085298000080")
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: Get.width,
                height: 100,
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 9,
                        offset: Offset(0, 6) // changes position of shadow
                        ),
                  ],
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        "assets/kominfo.png",
                        // width: 100,
                        // height: 100,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lapor Diskominfo",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: 5),
                        Text("081342393538")
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: Get.width,
                height: 100,
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 9,
                        offset: Offset(0, 6) // changes position of shadow
                        ),
                  ],
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        "assets/pupr.png",
                        // width: 100,
                        // height: 100,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lapor Dinas PUPR",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: 5),
                        Text("085298000080")
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: Get.width,
                height: 100,
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 9,
                        offset: Offset(0, 6) // changes position of shadow
                        ),
                  ],
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        "assets/dlhk.png",
                        // width: 100,
                        // height: 100,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lapor DLHK",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: 5),
                        Text("081342393538")
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )),
        bottomNavigationBar: ConvexAppBar(
          initialActiveIndex: 3,
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
