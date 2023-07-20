import 'help_model.dart';

class HelpResponse {
  final int status;
  final String message;
  final List<Help> help;

  HelpResponse({required this.status, required this.message, required this.help});

  factory HelpResponse.fromJson(Map<String, dynamic> json) {
    var helpList = json['help'] as List;
    List<Help> helps = helpList.map((i) => Help.fromJson(i)).toList();

    return HelpResponse(
      status: json['status'],
      message: json['message'],
      help: helps,
    );
  }
}