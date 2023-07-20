import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/main_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
// Add this line for debugging
    return BlocProvider(
      create: (context) => GlobalCubit(),
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = GlobalCubit.get(context);
          return FutureBuilder(
            future: _getAction(),
            builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
              if (snapshot.hasData) {
                String? userPhone = snapshot.data;
                return verifyScreen(cubit, context, userPhone);
              } else {
                // Handle loading state
                return const CircularProgressIndicator();
              }
            },
          );
        },
      ),
    );
  }

  Future<String?> _getAction() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userPhone');
  }

  Scaffold verifyScreen(
      GlobalCubit cubit, BuildContext context, String? phone) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'Verify Phone',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.primaryColor,
                AppColor.white,
                AppColor.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 6,
                    ),
                    Form(
                      key: cubit.otpFormKey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _textFieldOTP(
                              context: context,
                              first: true,
                              last: false,
                              controllerOTP: cubit.num1),
                          _textFieldOTP(
                              context: context,
                              first: false,
                              last: false,
                              controllerOTP: cubit.num2),
                          _textFieldOTP(
                              context: context,
                              first: false,
                              last: false,
                              controllerOTP: cubit.num3),
                          _textFieldOTP(
                              context: context,
                              first: false,
                              last: true,
                              controllerOTP: cubit.num4),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 10,
                    ),
                    TextButton(
                      onPressed: () {},
                      child:const Text(
                        'Resend Code',
                        style: TextStyle(
                            color: AppColor.primaryColor, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 6,
                    ),
                    mainButton(
                        onPressed: () async {
                          //merging code to send it to API as a single value 
                          String code =
                              '${cubit.num1.text}${cubit.num2.text}${cubit.num3.text}${cubit.num4.text}';

                          final response = await cubit.sendOtp(code, phone!);
                          // print('====================================');
                          // print('response    $phone         $code');
                          // print('====================================');
                          if (response.status == 200) {
                            Fluttertoast.showToast(
                              msg: response.message,
                              toastLength: Toast.LENGTH_SHORT,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacementNamed(context, '/home');
                            // ignore: use_build_context_synchronously
                            cubit.changeBottomNav(2, context);
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
                        txt: 'Verify')
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP({
    required bool first,
    required bool last,
    required BuildContext context,
    required TextEditingController controllerOTP,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 75,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        SizedBox(
          height: 80,
          width: 70,
          child: TextField(
            controller: controllerOTP,
            autofocus: true,
            onChanged: (value) {
              if (value.length == 1 && last == false) {
                FocusScope.of(context).nextFocus();
              }
              if (value.isEmpty && first == false) {
                FocusScope.of(context).previousFocus();
              }
            },
            showCursor: true,
            readOnly: false,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counter:const Offstage(),
              contentPadding: const EdgeInsets.symmetric(vertical: 50),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:const  BorderSide(width: 2, color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
