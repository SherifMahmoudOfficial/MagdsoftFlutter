class Account {
  final int id;
  final String name;
  final String phone;

  Account({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}