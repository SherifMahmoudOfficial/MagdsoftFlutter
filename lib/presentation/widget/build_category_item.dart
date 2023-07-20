import 'package:flutter/material.dart';

import '../styles/colors.dart';

Container categoryItem(
    {required String name,
    required AssetImage image,
    required bool isSelected}) {
  return Container(
    height: 50,
    width: 129,
    decoration: BoxDecoration(
      color: isSelected ? AppColor.primaryColor : AppColor.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          spreadRadius: 1,
          blurRadius: 5,
          offset:const Offset(0, 2), // changes position of shadow
        ),
      ],
    ),
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                spreadRadius: 1,
                blurRadius: 5,
                offset:const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColor.white,
              backgroundImage: image,
            ),
          ),
        ),
       const SizedBox(
          width: 5,
        ),
        Text(
          name,
          style: TextStyle(
            color: isSelected ? AppColor.white : AppColor.black,
            fontSize: 22,
          ),
        )
      ],
    ),
  );
}
