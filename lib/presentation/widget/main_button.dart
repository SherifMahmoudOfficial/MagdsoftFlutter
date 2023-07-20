import 'package:flutter/material.dart';

Widget mainButton({String? txt, Function()? onPressed}) {
  return Container(
    height: 50,
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient:const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xff0062bd), Color(0x7f0062bd), Color(0x440062bd)],
        )),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
      child: Center(
        child: Text(
          "$txt",
          style: const TextStyle(
            fontSize: 20
          ),
        ),
      ),
    ),
  );
}
