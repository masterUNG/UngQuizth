import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungquizth/models/user_model.dart';
import 'package:ungquizth/states/authen.dart';
import 'package:ungquizth/states/main_student.dart';
import 'package:ungquizth/states/main_teacher.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:ungquizth/utility/app_controller.dart';
import 'package:ungquizth/website_states/authen_website.dart';

var getPages = <GetPage<dynamic>>[
  GetPage(
    name: '/authen',
    page: () => const Authen(),
  ),
  GetPage(
    name: '/Student',
    page: () => const MainStudent(),
  ),
  GetPage(
    name: '/Teacher',
    page: () => const MainTeacher(),
  ),
  GetPage(
    name: '/website',
    page: () => const AuthenWebSite(),
  )
];

String? firstPage;

AppController appController = Get.put(AppController());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // Website

    firstPage = '/website';
    runApp(MyApp());
  } else {
    // Mobile

    await Firebase.initializeApp().then((value) {
      FirebaseAuth.instance.authStateChanges().listen((event) async {
        print('event ---> $event');

        if (event == null) {
          //Authen
          firstPage = '/authen';
          runApp(MyApp());
        } else {
          //Main

          String uidLogin = event.uid;
          FirebaseFirestore.instance
              .collection('user')
              .doc(uidLogin)
              .get()
              .then((value) {
            UserModel userModel = UserModel.fromMap(value.data()!);
            appController.currentUserModels.add(userModel);

            firstPage = '/${userModel.typeUser}';
            runApp(MyApp());
          });
        }
      });
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: getPages,
      initialRoute: firstPage,
    );
  }
}
