import 'account_model.dart';

class OtpResponse {
  final int status;
  final String message;
  final Account? account;

  OtpResponse({
    required this.status,
    required this.message,
    this.account,
  });

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
      status: json['status'],
      message: json['message'],
      //here we must use containsKey('account') because in case of error there is no account value in api response
      account: json.containsKey('account') ? Account.fromJson(json['account']) : null,
    );
  }
}