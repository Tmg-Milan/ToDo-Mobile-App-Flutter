import 'package:flutter/material.dart';

class SegmentTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const new({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(children: [Text(title), Spacer(), Text(subtitle)]);
  }
}
