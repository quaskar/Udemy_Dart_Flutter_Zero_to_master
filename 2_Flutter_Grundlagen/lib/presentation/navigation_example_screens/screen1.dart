import 'package:flutter/material.dart';
import 'package:fluttergrundlagen/presentation/widgets_examples/widgets/custom_button.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Screen 1"),
        centerTitle: true,
      ),
      body: Center(
          child: CustomButton(
        buttonColor: Colors.green,
        text: "Navigation back",
        onPressed: () {
          Navigator.of(context).pop();
        },
      )),
    );
  }
}
