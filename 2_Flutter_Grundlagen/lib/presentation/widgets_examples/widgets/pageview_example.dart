import 'package:flutter/material.dart';

class PageviewExample extends StatelessWidget {
  const PageviewExample({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.2,
      child: PageView(
        controller: PageController(viewportFraction: 0.95),
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SinglePage(
              size: size,
              title: 'Title 1',
              text:
                  'jkasdkjs fkjsfjk sadfkjsafjk sajf sakjf sajkf jkasf jksaf kjsaf jksaf',
            ),
          ),
          SinglePage(
            size: size,
            title: "Title 2",
            text:
                "skfnka jksafnjksa fksafjk aksj fjksa fjksa fkjas fkjas fjka sfkja fjkas fkasf",
          ),
        ],
      ),
    );
  }
}

class SinglePage extends StatelessWidget {
  final Size size;
  final String title;
  final String text;

  const SinglePage(
      {Key? key, required this.size, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * 0.2,
        width: size.width * 0.85,
        decoration: BoxDecoration(
            color: Colors.grey[700], borderRadius: BorderRadius.circular(15)),
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ],
            )));
  }
}
