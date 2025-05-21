// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_beat_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignedBeatRequest _$AssignedBeatRequestFromJson(Map<String, dynamic> json) =>
    AssignedBeatRequest(
      action: json['action'] as String,
      zoneId: (json['zone_id'] as num).toInt(),
      wardId: (json['ward_id'] as num).toInt(),
    );

Map<String, dynamic> _$AssignedBeatRequestToJson(
        AssignedBeatRequest instance) =>
    <String, dynamic>{
      'action': instance.action,
      'zone_id': instance.zoneId,
      'ward_id': instance.wardId,
    };
