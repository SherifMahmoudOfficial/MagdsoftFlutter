class VerifyPhone {
  final String phone;
  final String name;
  final int status;
  final String message;
  final String? token;

  VerifyPhone({required this.phone, required this.name, required this.status, required this.message, this.token});

 factory VerifyPhone.fromJson(Map<String, dynamic> json) {
  return VerifyPhone(
    phone: json['phone'] ?? '',
    name: json['name'] ?? '',
    status: json['status'] ?? 0,
    message: json['message'] ?? '',
    //there is no token in API but it should be in future 
    token: json['token'] ?? '',
  );
}

  Map<String, dynamic> toJson() => {
        'phone': phone,
        'name': name,
      };
}