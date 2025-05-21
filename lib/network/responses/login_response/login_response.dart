import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final bool? status;
  final String? message;
  final List<Result>? result;

  const LoginResponse({
    this.status,
    this.message,
    this.result,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class Result {
  final int? id;
  @JsonKey(name: 'employee_id')
  final int? employeeId;
  final String? email;
  final String? password;
  final String? position;
  @JsonKey(name: 'full_name')
  final String? fullName;
  @JsonKey(name: 'user_type')
  final int? userType;
  @JsonKey(name: 'login_status')
  final int? loginStatus;
  @JsonKey(name: 'mobile_no')
  final int? mobileNo;
  @JsonKey(name: 'login_date_time')
  final int? loginDateTime;
  @JsonKey(name: 'logout_date_time')
  final int? logoutDateTime;
  final List<Zones>? zones;
  final List<dynamic>? wards;

  const Result({
    this.id,
    this.employeeId,
    this.email,
    this.password,
    this.position,
    this.fullName,
    this.userType,
    this.loginStatus,
    this.mobileNo,
    this.loginDateTime,
    this.logoutDateTime,
    this.zones,
    this.wards,
  });

  factory Result.fromJson(Map<String, dynamic> json) =>
      _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Zones {
  @JsonKey(name: 'zone_id')
  final int? zoneId;
  @JsonKey(name: 'zone_name')
  final String? zoneName;

  const Zones({
    this.zoneId,
    this.zoneName,
  });

  factory Zones.fromJson(Map<String, dynamic> json) =>
      _$ZonesFromJson(json);

  Map<String, dynamic> toJson() => _$ZonesToJson(this);
}
