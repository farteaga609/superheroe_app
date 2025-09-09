import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bloquepoder extends StatefulWidget {
  final double power;
  final Color color;
  final String textopod;

  const Bloquepoder({super.key, required this.power, required this.color, required this.textopod});

  @override
  State<Bloquepoder> createState() => _BloquepoderState();
}

class _BloquepoderState extends State<Bloquepoder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: widget.power,
          width: 20,
          color: widget.color,
        ),
        Text(widget.textopod),
      ],
    );
  }
}



