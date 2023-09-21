import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungquizth/states/list_exercise.dart';
import 'package:ungquizth/states/list_student.dart';
import 'package:ungquizth/utility/app_constant.dart';
import 'package:ungquizth/utility/app_controller.dart';
import 'package:ungquizth/utility/app_dialog.dart';
import 'package:ungquizth/widgets/widget_image_network.dart';
import 'package:ungquizth/widgets/widget_menu.dart';
import 'package:ungquizth/widgets/widget_text.dart';
import 'package:ungquizth/widgets/widget_text_button.dart';

class MainTeacher extends StatefulWidget {
  const MainTeacher({super.key});

  @override
  State<MainTeacher> createState() => _MainTeacherState();
}

class _MainTeacherState extends State<MainTeacher> {
  AppController appController = Get.put(AppController());

  var bodys = <Widget>[
    const ListExercise(),
    const ListStudent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            Obx(() {
              return appController.currentUserModels.isEmpty
                  ? const SizedBox()
                  : UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: Colors.deepOrange),
                      accountName: WidgetText(
                        data: appController.currentUserModels.last.name,
                        textStyle: AppConstant().h2Style(),
                      ),
                      accountEmail: WidgetText(
                          data: appController.currentUserModels.last.typeUser),
                      currentAccountPicture: WidgetImageNetwork(
                          urlImage:
                              appController.currentUserModels.last.urlAvatar),
                    );
            }),
            WidgetMenu(
              titleWidget: const WidgetText(data: 'แบบฝึกหัด'),
              leadWidget: const Icon(Icons.check),
              tapFunc: () {
                appController.indexBody.value = 0;
                Get.back();
              },
            ),
            WidgetMenu(
              titleWidget: const WidgetText(data: 'นักเรียนที่ทำ แบบฝึกหัด'),
              leadWidget: const Icon(Icons.person),
              tapFunc: () {
                appController.indexBody.value = 1;
                Get.back();
              },
            ),
            const Spacer(),
            const Divider(
              color: Colors.black,
            ),
            WidgetMenu(
              titleWidget: const WidgetText(data: 'SignOut'),
              subTitleWidget:
                  const WidgetText(data: 'ออกจาก Account ไป Login ใหม่'),
              leadWidget: const Icon(
                Icons.logout,
                size: 36,
                color: Colors.black,
              ),
              tapFunc: () {
                Get.back();
                AppDialog().normalDialog(
                    title: 'SignOut ?',
                    firtAction: WidgetTextButton(
                      label: 'SignOut',
                      pressFunc: () async {
                        FirebaseAuth.instance.signOut().then((value) {
                          Get.offAllNamed('/authen');
                        });
                      },
                    ));
              },
            ),
          ],
        ),
      ),
      body: Obx(
         () {
          return SafeArea(child: bodys[appController.indexBody.value]);
        }
      ),
    );
  }
}
