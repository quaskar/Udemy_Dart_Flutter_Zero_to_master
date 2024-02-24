import 'package:flutter/material.dart';
import 'package:fluttergrundlagen/presentation/widgets_examples/widgets/custom_button.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Screen 2"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              buttonColor: Colors.yellow,
              text: "Navigation pressed",
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              buttonColor: Colors.yellow,
              text: "Go to Screen 1",
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/screen1");
              },
            ),
          ],
        ),
      ),
    );
  }
}
