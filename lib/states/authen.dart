import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:ungquizth/utility/app_constant.dart';
import 'package:ungquizth/utility/app_service.dart';
import 'package:ungquizth/widgets/widget_button.dart';
import 'package:ungquizth/widgets/widget_image.dart';
import 'package:ungquizth/widgets/widget_logo_apppname.dart';
import 'package:ungquizth/widgets/widget_text.dart';

class Authen extends StatelessWidget {
  const Authen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const WidgetLogoAppName(),
            SignInButton(Buttons.GoogleDark, onPressed: () {
              AppService().processSignInWithGmail();
            })
          ],
        ),
      ),
      // floatingActionButton: WidgetButton(
      //   label: 'SignOut',
      //   pressFunc: () async {
      //     FirebaseAuth.instance.signOut().then((value) {
      //       print('SignOut Success');
      //     });
      //   },
      // ),
    );
  }
}
