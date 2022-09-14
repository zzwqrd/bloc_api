
import 'package:flutter/material.dart';

class Btn extends StatelessWidget{
  final dynamic onTap;
  final String txt;

  const Btn({super.key, this.onTap, required this.txt});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            txt,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}