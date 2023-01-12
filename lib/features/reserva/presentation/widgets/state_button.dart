import 'package:flutter/material.dart';

class StateButton extends StatelessWidget {
  final String text;
  final bool selected;

  const StateButton({super.key, required this.text, required this.selected});

  @override
  Widget build(BuildContext context) {

    final boxDecoration = BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5.0,
              spreadRadius: 1.0
            )
          ],
          color: selected ? const Color(0xff0B4762) : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(16)));

    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      // width: 110,
      height: 30,
      decoration:  boxDecoration,
      duration: const Duration(milliseconds: 500),
      child: Text('$text (0)', 
                  style:  TextStyle(
                    color: selected ? Colors.white : const Color(0xff0B4762) ,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing:  2 
                    )),
    );
  }
}