import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:get/get.dart';
import 'package:lapor_pak/app/routes/app_pages.dart';

import '../controllers/bantuan_controller.dart';

class BantuanView extends GetView<BantuanController> {
  const BantuanView({Key? key}) : super(key: key);

  final _contentStyle = const TextStyle(
      height: 1.4,
      color: Colors.black54,
      fontSize: 17,
      fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text("Bantuan",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        body: Accordion(
            maxOpenSections: 1,
            headerBackgroundColorOpened: Colors.black54,
            scaleWhenAnimating: true,
            openAndCloseAnimation: true,
            headerPadding: const EdgeInsets.all(20),
            sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            sectionClosingHapticFeedback: SectionHapticFeedback.light,
            children: [
              AccordionSection(
                isOpen: true,
                headerBackgroundColor: Color(0xff1A669D),
                headerBackgroundColorOpened: Color(0xff1A669D),
                header: Text('Menu DisdukCapil',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
                content:
                    Text(controller.disdukCapilContent, style: _contentStyle),
                contentVerticalPadding: 25,
                contentHorizontalPadding: 25,
                contentBorderWidth: 1,
                contentBorderColor: Colors.black12,
              ),
              AccordionSection(
                isOpen: true,
                headerBackgroundColor: Color(0xff1A669D),
                headerBackgroundColorOpened: Color(0xff1A669D),
                header: Text('Menu Pelaporan',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
                content: Text(controller.laporanContent, style: _contentStyle),
                contentVerticalPadding: 25,
                contentHorizontalPadding: 25,
                contentBorderWidth: 1,
                contentBorderColor: Colors.black12,
              ),
              AccordionSection(
                isOpen: true,
                headerBackgroundColor: Color(0xff1A669D),
                headerBackgroundColorOpened: Color(0xff1A669D),
                header: Text('DIMAS (Diskusi Masyarakat)',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
                content: Text(controller.dimasContent, style: _contentStyle),
                contentVerticalPadding: 25,
                contentHorizontalPadding: 25,
                contentBorderWidth: 1,
                contentBorderColor: Colors.black12,
              ),
              AccordionSection(
                isOpen: true,
                headerBackgroundColor: Color(0xff1A669D),
                headerBackgroundColorOpened: Color(0xff1A669D),
                header: Text('News Lapor Pak!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
                content: Text(controller.newssContent, style: _contentStyle),
                contentVerticalPadding: 25,
                contentHorizontalPadding: 25,
                contentBorderWidth: 1,
                contentBorderColor: Colors.black12,
              ),
            ]),
        bottomNavigationBar: ConvexAppBar(
          initialActiveIndex: 1,
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
