import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungquizth/utility/app_dialog.dart';
import 'package:ungquizth/widgets/widget_menu.dart';
import 'package:ungquizth/widgets/widget_text.dart';
import 'package:ungquizth/widgets/widget_text_button.dart';

class MainStudent extends StatelessWidget {
  const MainStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(accountName: null, accountEmail: null),
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
      body: SafeArea(
        child: WidgetText(data: 'This is Student'),
      ),
    );
  }
}
