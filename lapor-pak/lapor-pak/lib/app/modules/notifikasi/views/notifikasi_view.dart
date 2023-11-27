import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:lapor_pak/app/routes/app_pages.dart';

import '../controllers/notifikasi_controller.dart';

class NotifikasiView extends GetView<NotifikasiController> {
  NotifikasiView({Key? key}) : super(key: key);
  NotifikasiController controller = Get.put(NotifikasiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text("Notifikasi",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: controller.notifStream,
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
                  var notifDate = formatter.format(d);
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
                                offset:
                                    Offset(0, 6) // changes position of shadow
                                ),
                          ],
                          borderRadius: BorderRadius.circular(15)),
                      child: InkWell(
                          onTap: () {
                            Get.defaultDialog(
                                backgroundColor: Color(0xff1A669D),
                                titleStyle: TextStyle(color: Colors.white),
                                middleTextStyle: TextStyle(color: Colors.white),
                                contentPadding: EdgeInsets.all(20),
                                titlePadding: EdgeInsets.all(20),
                                title: data['judul'],
                                middleText: data['keterangan'] +
                                    "\n\n" +
                                    notifDate.toString());
                          },
                          child: Row(children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.pink.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.message,
                                color: Colors.pink,
                                size: 30,
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
                                  notifDate.toString(),
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
        bottomNavigationBar: ConvexAppBar(
          initialActiveIndex: 4,
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
