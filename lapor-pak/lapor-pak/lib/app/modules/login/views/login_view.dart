import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lapor_pak/app/controllers/auth_controller.dart';
import 'package:lapor_pak/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();
  final LoginController controller = Get.put(LoginController());
  bool showPass = false;
  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            Image.asset(
              'assets/logo.png',
              width: 120,
              height: 120,
            ),
            SizedBox(height: 10),
            Text(
              "LAPOR PAK!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "FredokaOne",
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  color: Color(0xff1A669D)),
            ),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                      child: TextField(
                        controller: controller.emailC,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 13.0),
                          hintStyle: TextStyle(fontSize: 11.0),
                          border: InputBorder.none,
                          hintText: 'Your email',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                        ),
                        child: Obx(
                          () => TextField(
                            obscureText:
                                controller.hidePass == true ? true : false,
                            controller: controller.passC,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: controller.hidePass == true
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                onPressed: () {
                                  controller.hidePass == true
                                      ? controller.hidePass(false)
                                      : controller.hidePass(true);
                                },
                              ),
                              labelStyle: TextStyle(fontSize: 13.0),
                              hintStyle: TextStyle(fontSize: 11.0),
                              border: InputBorder.none,
                              hintText: 'Your Password',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 12.0),
                            ),
                          ),
                        )),
                    SizedBox(height: 30),
                    Container(
                        width: size.width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(200, 50),
                                // shape: StadiumBorder(),
                                backgroundColor: Color(0xff1A669D)),
                            onPressed: () {
                              controller.isLoading(true);
                              authC.login(controller.emailC.text,
                                  controller.passC.text);
                            },
                            child: Text("Masuk"))),
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Modal Popup Title'),
                              content: Text('Modal Popup Content'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        "Lupa password ? ",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color(0xff1A669D)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Belum punya akun ? "),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.REGISTER),
                          child: Text(
                            "daftar",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Color(0xff1A669D)),
                          ),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
