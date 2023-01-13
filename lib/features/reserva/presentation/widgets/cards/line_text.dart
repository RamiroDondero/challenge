import 'package:flutter/material.dart';

class LineText extends StatelessWidget {
  final IconData icon;
  final String text;

  const LineText( this.icon, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 12, color: Colors.grey),
        const SizedBox(width: 5),
        Text(text, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
