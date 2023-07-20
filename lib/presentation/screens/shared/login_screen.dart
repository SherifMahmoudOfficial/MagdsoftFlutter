import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/main_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../widget/input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GlobalCubit(),
        child: BlocConsumer<GlobalCubit, GlobalState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = GlobalCubit.get(context);
            return loginScreen(cubit, context);
          },
        ));
  }

  Scaffold loginScreen(GlobalCubit cubit, BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: const Alignment(0, -0.3),
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              backgroundImage(context),
              backgroundArea(context),
            ],
          ),
          Container(
            height: MediaQuery.sizeOf(context).height / 2.4,
            width: MediaQuery.sizeOf(context).width / 1.13,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius:const  BorderRadius.all(
                Radius.circular(40),
              ),
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
              padding: const EdgeInsets.all(30),
              child: Form(
                key: cubit.loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Welcome',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2.5,
                      child: Container(
                        height: 3,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    inputField(
                      controller: cubit.nameController,
                      isValidText: 'Not Valid',
                      label: 'Enter your Full Name',
                      maxLines: 1,
                    ),
                    inputField(
                      controller: cubit.phoneController,
                      isValidText: 'Not Valid',
                      label: 'Enter your Phone Number',
                      maxLines: 1,
                    ),
                    mainButton(
                      onPressed: () async {
                        final phone = cubit.phoneController.text;
                        // print('====================================');
                        // print('    $phone        ');
                        // print('====================================');
                        final name = cubit.nameController.text;

                        final response = await cubit.verifyPhone(phone, name);
                        if (response.status == 200) {
                          Fluttertoast.showToast(
                            msg: response.message,
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );

                          //SharedPreferences used to store user phone number so we can use in future and in any screen we want without asking user to re-enter it
                        
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setString('userPhone', phone);

                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacementNamed(
                            context,
                            '/otp',
                          );
                          
                        } else {
                          Fluttertoast.showToast(
                            msg: response.message,
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      },
                      txt: 'Login',
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container backgroundArea(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 1.6,
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 2.5,
          ),
          orDivider(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 12,
          ),
          socialButtons()
        ],
      ),
    );
  }

  Row orDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 2,
            color: AppColor.primaryColor,
          ),
        ),
       const SizedBox(
          width: 10,
        ),
      const  Text(
          'OR',
          style: TextStyle(color: AppColor.primaryColor),
        ),
       const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            height: 2,
            color: AppColor.primaryColor,
          ),
        ),
      const  SizedBox(
          width: 20,
        ),
      ],
    );
  }

  Row socialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => print('google clicked'),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child:const CircleAvatar(
              backgroundColor: AppColor.white,
              backgroundImage: AssetImage('assets/images/facebook.png'),
            ),
          ),
        ),
       const SizedBox(
          width: 30,
        ),
        GestureDetector(
          onTap: () => print('apple clicked'),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child:const CircleAvatar(
              backgroundColor: AppColor.white,
              backgroundImage: AssetImage('assets/images/apple-logo.png'),
            ),
          ),
        ),
       const SizedBox(
          width: 30,
        ),
        GestureDetector(
          onTap: () => print('facebook clicked'),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset:const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: const CircleAvatar(
              backgroundColor: AppColor.white,
              backgroundImage: AssetImage('assets/images/google.png'),
            ),
          ),
        )
      ],
    );
  }

  Column backgroundImage(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image(
              height: MediaQuery.sizeOf(context).height / 2,
              image:const AssetImage('assets/images/login-background.png'),
            ),
            Container(
              height: MediaQuery.sizeOf(context).height / 2.2,
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.4),
              ),
            )
          ],
        ),
       const Spacer()
      ],
    );
  }
}
