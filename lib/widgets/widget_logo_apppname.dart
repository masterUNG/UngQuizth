import 'package:flutter/material.dart';
import 'package:ungquizth/utility/app_constant.dart';
import 'package:ungquizth/widgets/widget_image.dart';
import 'package:ungquizth/widgets/widget_text.dart';

class WidgetLogoAppName extends StatelessWidget {
  const WidgetLogoAppName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const WidgetImage(
          size: 52,
        ),
        WidgetText(
          data: 'Quizth',
          textStyle: AppConstant().h1Style(),
        )
      ],
    );
  }
}