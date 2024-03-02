import 'package:flutter/material.dart';
import 'dart:io';

class PlatWrapper extends StatelessWidget {
  final Widget cupertino;
  final Widget material;
  const PlatWrapper({Key? key, required this.cupertino, required this.material})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return material;
  }
}
