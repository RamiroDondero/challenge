import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contenido extends StatelessWidget {
  final String tel;
  final String email;
  final String comentario;

  const Contenido(
      {super.key,
      required this.tel,
      required this.email,
      required this.comentario});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tel.isEmpty ? const SizedBox() : _LineText(Icons.phone, tel),
        email.isEmpty ? const SizedBox() : _LineText(Icons.email, email),
        comentario.isEmpty
            ? const SizedBox()
            : _LineText(CupertinoIcons.chat_bubble_text, comentario),
      ],
    );
  }
}

class _LineText extends StatelessWidget {
  final IconData icon;
  final String text;

  const _LineText(this.icon, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // visualDensity: VisualDensity(vertical: ),
      minVerticalPadding: 0,
      dense: true,
      minLeadingWidth: 0,
      leading: Icon(icon, size: 12, color: Colors.grey),
      title:   Text(text, maxLines: 2, style: const TextStyle(color: Colors.grey ,overflow: TextOverflow.ellipsis)),
    );
  }
}

