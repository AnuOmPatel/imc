// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_beat_by_emp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewBeatsByEmpRequest _$ViewBeatsByEmpRequestFromJson(
        Map<String, dynamic> json) =>
    ViewBeatsByEmpRequest(
      action: json['action'] as String,
      employeeId: (json['employee_id'] as num).toInt(),
    );

Map<String, dynamic> _$ViewBeatsByEmpRequestToJson(
        ViewBeatsByEmpRequest instance) =>
    <String, dynamic>{
      'action': instance.action,
      'employee_id': instance.employeeId,
    };
