// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: (json['id'] as num?)?.toInt(),
      employeeId: (json['employee_id'] as num?)?.toInt(),
      email: json['email'] as String?,
      password: json['password'] as String?,
      position: json['position'] as String?,
      fullName: json['full_name'] as String?,
      userType: (json['user_type'] as num?)?.toInt(),
      loginStatus: (json['login_status'] as num?)?.toInt(),
      mobileNo: (json['mobile_no'] as num?)?.toInt(),
      loginDateTime: (json['login_date_time'] as num?)?.toInt(),
      logoutDateTime: (json['logout_date_time'] as num?)?.toInt(),
      zones: (json['zones'] as List<dynamic>?)
          ?.map((e) => Zones.fromJson(e as Map<String, dynamic>))
          .toList(),
      wards: json['wards'] as List<dynamic>?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'employee_id': instance.employeeId,
      'email': instance.email,
      'password': instance.password,
      'position': instance.position,
      'full_name': instance.fullName,
      'user_type': instance.userType,
      'login_status': instance.loginStatus,
      'mobile_no': instance.mobileNo,
      'login_date_time': instance.loginDateTime,
      'logout_date_time': instance.logoutDateTime,
      'zones': instance.zones,
      'wards': instance.wards,
    };

Zones _$ZonesFromJson(Map<String, dynamic> json) => Zones(
      zoneId: (json['zone_id'] as num?)?.toInt(),
      zoneName: json['zone_name'] as String?,
    );

Map<String, dynamic> _$ZonesToJson(Zones instance) => <String, dynamic>{
      'zone_id': instance.zoneId,
      'zone_name': instance.zoneName,
    };
