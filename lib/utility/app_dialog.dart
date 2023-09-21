import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungquizth/widgets/widget_logo_apppname.dart';
import 'package:ungquizth/widgets/widget_text.dart';
import 'package:ungquizth/widgets/widget_text_button.dart';

class AppDialog {
  void normalDialog({required String title, Widget? firtAction}) {
    Get.dialog(
      AlertDialog(
        title: WidgetText(data: title),
        icon: const WidgetLogoAppName(),
        actions: [
          firtAction ?? const SizedBox(),
          WidgetTextButton(
            label: 'Cancel',
            pressFunc: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }
}
