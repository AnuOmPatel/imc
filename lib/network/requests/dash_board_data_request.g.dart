// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dash_board_data_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashBoardDataRequest _$DashBoardDataRequestFromJson(
        Map<String, dynamic> json) =>
    DashBoardDataRequest(
      action: json['action'] as String?,
      zoneId: (json['zone_id'] as num?)?.toInt(),
      wardId: (json['ward_id'] as num?)?.toInt(),
      employeeId: (json['employee_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DashBoardDataRequestToJson(
        DashBoardDataRequest instance) =>
    <String, dynamic>{
      'action': instance.action,
      'zone_id': instance.zoneId,
      'ward_id': instance.wardId,
      'employee_id': instance.employeeId,
    };
