import 'package:flutter/material.dart';

class MeatItemTrait extends StatelessWidget {
  const MeatItemTrait({super.key, required this.icons, required this.label});
  final IconData icons;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icons,
          size: 17,
          color: Colors.white,
        ),
        SizedBox(
          width: 5,
        ),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
