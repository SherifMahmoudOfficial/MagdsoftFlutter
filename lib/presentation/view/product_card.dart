import 'package:flutter/material.dart';

import '../styles/colors.dart';

Widget productCard(
    {required BuildContext context,
    required Image productImage,
    required bool isFavorite,
    required String productCompany,
    required String productName,
    required String productPrice}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(
        context,
        '/product',
      );
    },
    child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 5,
                offset:const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Stack(
                alignment:const Alignment(0.9, -0.8),
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height / 6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset:const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: productImage,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print('fav clicked'),
                    child: Image(
                      image: isFavorite
                          ?const AssetImage('assets/images/loved.png')
                          : const AssetImage('assets/images/love.png'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productCompany,
                        style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        productName,
                        style:const TextStyle(
                          color: AppColor.accentColor,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height / 35),
                      Text(
                        productPrice,
                        style: const TextStyle(
                          color: AppColor.accentColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => print('add Clicked'),
          child: Container(
            height: 40,
            width: 40,
            decoration:const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff0062bd),
                  Color(0x7f0062bd),
                  Color(0x440062bd)
                ],
              ),
            ),
            child:const Icon(
              Icons.add,
              color: AppColor.white,
            ),
          ),
        ),
      ],
    ),
  );
}
