import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/help_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/login_screen.dart';
import 'package:http/http.dart' as http;

import '../../constants/end_points.dart';
import '../../data/models/help_response_model.dart';
import '../../data/models/otp_model.dart';
import '../../data/models/product_model.dart';
import '../../data/models/verify_phone_model.dart';
import '../../presentation/screens/shared/favorites_screen.dart';
import '../../presentation/screens/shared/home_screen.dart';
import '../../presentation/screens/shared/notifications_screen.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  //HomeLayout 
  static int currentScreenIndex = 2;
  static List<Widget> screens = [
    const LoginScreen(),
    const FavoriteScreen(),
    const HomeScreen(),
    const NotificationsScreen(),
    const HelpScreen(),
  ];
  PageController homeLayoutController = PageController();

  //change bottom navigation bar selected icon and screen
  void changeBottomNav(currentIndex, BuildContext context) {
    currentScreenIndex = currentIndex;
    if (currentIndex == 0) {
      Navigator.pushReplacementNamed(context, '/login');
      emit(ChangeBottomNavState());
    }
    emit(ChangeBottomNavState());
  }

  //Help Screen Logic

// Get help data from API
  Future<HelpResponse> fetchHelp() async {
    final response = await http.get(Uri.parse('${baseURL}getHelp'));

    if (response.statusCode == 200) {
      return HelpResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load help');
    }
  }

  //Login
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  //form key for validation
  final loginFormKey = GlobalKey<FormState>();
//verify Phone number from API  
  Future<VerifyPhone> verifyPhone(String phone, String name) async {
    final response = await http.post(
      Uri.parse('${baseURL}verifyPhone'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          VerifyPhone(phone: phone, name: name, status: 0, message: '')),
    );

    if (response.statusCode == 200) {
      var formdata = loginFormKey.currentState;
      if (formdata!.validate()) {
        formdata.save();
      }

      return VerifyPhone.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to verify phone: ${response.statusCode}');
    }
  }

  //OTP
  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();
  final TextEditingController num3 = TextEditingController();
  final TextEditingController num4 = TextEditingController();
  final otpFormKey = GlobalKey<FormState>();

//Post OTP code to API
  Future<OtpResponse> sendOtp(String code, String phone) async {
    final response = await http.post(
      Uri.parse('${baseURL}otp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'code': code, 'phone': phone}),
    );

    if (response.statusCode == 200) {
      var formdata = otpFormKey.currentState;
      if (formdata!.validate()) {
        formdata.save();
      }
      final data = jsonDecode(response.body);
      if (data != null && data is Map<String, dynamic>) {
        return OtpResponse.fromJson(data);
      } else {
        throw Exception('Failed to decode OTP response');
      }
    } else {
      throw Exception('Failed to get OTP: ${response.statusCode}');
    }
  }

//Get Products data from API

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('${baseURL}getProducts'));

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body)['products'];
      final List<Product> products =
          List<Product>.from(jsonList.map((json) => Product.fromJson(json)));
      return products;
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }
}
