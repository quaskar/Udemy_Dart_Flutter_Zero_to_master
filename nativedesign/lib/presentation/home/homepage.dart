import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text("Some other example"),
        cupertino: (_, __) => CupertinoNavigationBarData(
          transitionBetweenRoutes: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PlatformSlider(
                value: value,
                onChanged: (v) {
                  setState(() {
                    value = v;
                  });
                }),
            PlatformIconButton(
              onPressed: () {
                print("pressed");
              },
              materialIcon: const Icon(Icons.info),
              cupertinoIcon: const Icon(CupertinoIcons.info),
            ),
            Icon(PlatformIcons(context).info),
            const SizedBox(
              height: 30,
            ),
            PlatformCircularProgressIndicator(),
            const SizedBox(
              height: 30,
            ),
            PlatformWidget(
              cupertino: (_, __) =>
                  Container(height: 20, width: 40, color: Colors.redAccent),
              material: (_, __) =>
                  Container(height: 20, width: 40, color: Colors.blueAccent),
            ),
            const SizedBox(
              height: 30,
            ),
            PlatformWidgetBuilder(
                material: (_, child, __) => InkWell(
                    child: child,
                    onTap: () {
                      print("tap androide");
                    }),
                cupertino: (_, child, __) => GestureDetector(
                    child: child,
                    onTap: () {
                      print("tap ios");
                    }),
                child: Container(
                    color: Colors.teal,
                    height: 50,
                    width: 100,
                    child: const Center(
                      child: Text("button"),
                    )))
          ],
        ),
      ),
    );
  }
}
