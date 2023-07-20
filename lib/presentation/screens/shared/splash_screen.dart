import 'dart:math';

import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  
  // here we created the UI design using smaller components not PNG backgroud so we do not lose images quality in 
  //different screen ratio 

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        '/login',
      );
    });
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  width: MediaQuery.sizeOf(context).width / 2.2,
                  image: const AssetImage('assets/images/rectangle1.png'),
                ),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi),
                  child: const Image(
                    // width: MediaQuery.sizeOf(context).width / 1.8,
                    image: AssetImage('assets/images/subtract.png'),
                  ),
                ),
              ],
            ),
            Center(
              child: Image(
                width: MediaQuery.sizeOf(context).width / 1.8,
                image: const AssetImage('assets/images/app-logo.png'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Image(
                  // width: MediaQuery.sizeOf(context).width / 3,
                  image: AssetImage('assets/images/subtract.png'),
                ),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(2 * pi),
                  child: Image(
                    width: MediaQuery.sizeOf(context).width / 2.2,
                    image: const AssetImage('assets/images/rectangle2.png'),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
