// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ungquizth/models/user_model.dart';
import 'package:ungquizth/utility/app_constant.dart';
import 'package:ungquizth/utility/app_controller.dart';
import 'package:ungquizth/utility/app_service.dart';
import 'package:ungquizth/utility/app_snackbar.dart';
import 'package:ungquizth/widgets/widget_button.dart';
import 'package:ungquizth/widgets/widget_image_network.dart';
import 'package:ungquizth/widgets/widget_text.dart';

class Register extends StatefulWidget {
  const Register({
    Key? key,
    required this.urlImage,
    required this.name,
    required this.uid,
  }) : super(key: key);

  final String urlImage;
  final String name;
  final String uid;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 64,
            ),
            WidgetImageNetwork(urlImage: widget.urlImage),
            const SizedBox(
              height: 16,
            ),
            WidgetText(
              data: widget.name,
              textStyle: AppConstant().h2Style(),
            ),
            chooseTypeUser(),
            WidgetButton(
              label: 'Register',
              pressFunc: () {
                if (appController.typeUsers.last == null) {
                  //No Type User
                  AppSnackbar(
                          title: 'TypeUser ?',
                          message: 'Please Choose TypeUser')
                      .errrorSnackbar();
                } else {
                  UserModel model = UserModel(
                      name: widget.name,
                      typeUser: appController.typeUsers.last!,
                      uid: widget.uid,
                      urlAvatar: widget.urlImage);

                  AppService().processRegister(map: model.toMap(), uid: widget.uid);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget chooseTypeUser() {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Column(
          children: [
            WidgetText(
              data: 'TypeUser :',
              textStyle: AppConstant().h1Style(),
            ),
            RadioListTile(
              value: 'Student',
              groupValue: appController.typeUsers.last,
              onChanged: (value) {
                appController.typeUsers.add(value);
              },
              title: const WidgetText(data: 'Student'),
            ),
            RadioListTile(
              value: 'Teacher',
              groupValue: appController.typeUsers.last,
              onChanged: (value) {
                appController.typeUsers.add(value);
              },
              title: const WidgetText(data: 'Teacher'),
            ),
          ],
        ),
      );
    });
  }
}
