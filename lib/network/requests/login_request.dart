import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  final String action;
  final String username;
  final String password;

  LoginRequest({required this.action, required this.username, required this.password});

  Map<String, dynamic> toJson() => {
    'action': action,
    'username': username,
    'password': password,
  };
}
