import 'package:flutter/material.dart';

class MarkerToolTip extends StatelessWidget {
  final String name;
  const MarkerToolTip({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    const decoration = BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(12)));

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SizedBox(
        width: 120,
        height: 32,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: decoration,
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
