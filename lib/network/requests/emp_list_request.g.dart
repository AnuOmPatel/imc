// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emp_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeListRequest _$EmployeeListRequestFromJson(Map<String, dynamic> json) =>
    EmployeeListRequest(
      action: json['action'] as String,
      zoneId: (json['zone_id'] as num).toInt(),
      wardId: (json['ward_id'] as num).toInt(),
    );

Map<String, dynamic> _$EmployeeListRequestToJson(
        EmployeeListRequest instance) =>
    <String, dynamic>{
      'action': instance.action,
      'zone_id': instance.zoneId,
      'ward_id': instance.wardId,
    };
