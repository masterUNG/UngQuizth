import 'package:flutter/material.dart';
import 'package:ungquizth/widgets/widget_button.dart';
import 'package:ungquizth/widgets/widget_text.dart';

class ListExercise extends StatelessWidget {
  const ListExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WidgetText(data: 'This is List Exercise'),
      floatingActionButton: WidgetButton(
        label: 'เพิ่มแบบฝึกหัด',
        pressFunc: () {},
      ),
    );
  }
}
