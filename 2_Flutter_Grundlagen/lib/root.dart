import 'package:flutter/material.dart';
import 'package:fluttergrundlagen/presentation/couter_app/counter_app_page.dart';
import 'package:fluttergrundlagen/presentation/theme_animation/theme_animation_page.dart';
import 'package:fluttergrundlagen/presentation/widgets_examples/widgets_examples_page.dart';

class RootWidget2 extends StatefulWidget {
  const RootWidget2({super.key});

  @override
  State<RootWidget2> createState() => _RootWidget2State();
}

class _RootWidget2State extends State<RootWidget2> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          WidgetsExamplePage(),
          CounterAppPage(),
          ThemeAnimationPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.background,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "examples"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "counter"),
          BottomNavigationBarItem(icon: Icon(Icons.color_lens), label: "theme"),
        ],
      ),
    );
  }
}
