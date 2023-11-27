import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/disdukcapil_controller.dart';

class DisdukcapilView extends GetView<DisdukcapilController> {
  DisdukcapilView({Key? key}) : super(key: key);
  DisdukcapilController controller = Get.put(DisdukcapilController());

  final _contentStyle = const TextStyle(
      height: 1.4,
      color: Colors.black54,
      fontSize: 17,
      fontWeight: FontWeight.normal);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DISDUKCAPIL"),
        elevation: 0,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xff1A669D),
        onPressed: () {
          Get.toNamed(Routes.DISDUKCAPIL_FORM);
        },
        label: Text(
          'REGISTRASI',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        icon: Icon(Icons.add_comment_outlined),
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
              header: Text('Dokument Identitas',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
              content: Text(controller.contentDokumenIdentitas,
                  style: _contentStyle),
              contentVerticalPadding: 25,
              contentHorizontalPadding: 25,
              contentBorderWidth: 1,
              contentBorderColor: Colors.black12,
            ),
            AccordionSection(
              isOpen: true,
              headerBackgroundColor: Color(0xff1A669D),
              headerBackgroundColorOpened: Color(0xff1A669D),
              header: Text('Bukti Alamat',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
              content:
                  Text(controller.contentBuktiAlamat, style: _contentStyle),
              contentVerticalPadding: 25,
              contentHorizontalPadding: 25,
              contentBorderWidth: 1,
              contentBorderColor: Colors.black12,
            ),
            AccordionSection(
              isOpen: true,
              headerBackgroundColor: Color(0xff1A669D),
              headerBackgroundColorOpened: Color(0xff1A669D),
              header: Text('Foto Terbaru',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
              content:
                  Text(controller.contentFotoTerbaru, style: _contentStyle),
              contentVerticalPadding: 25,
              contentHorizontalPadding: 25,
              contentBorderWidth: 1,
              contentBorderColor: Colors.black12,
            ),
            AccordionSection(
              isOpen: true,
              headerBackgroundColor: Color(0xff1A669D),
              headerBackgroundColorOpened: Color(0xff1A669D),
              header: Text('Syarat Usia',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
              content: Text(controller.contentSyaratUsia, style: _contentStyle),
              contentVerticalPadding: 25,
              contentHorizontalPadding: 25,
              contentBorderWidth: 1,
              contentBorderColor: Colors.black12,
            ),
            AccordionSection(
              isOpen: true,
              headerBackgroundColor: Color(0xff1A669D),
              headerBackgroundColorOpened: Color(0xff1A669D),
              header: Text('Himbauan Tambahan',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
              content: Text(controller.contentHimbauan, style: _contentStyle),
              contentVerticalPadding: 25,
              contentHorizontalPadding: 25,
              contentBorderWidth: 1,
              contentBorderColor: Colors.black12,
            ),
          ]),
    );
  }
}
