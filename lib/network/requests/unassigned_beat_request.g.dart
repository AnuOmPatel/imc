// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unassigned_beat_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnAssignedBeatRequest _$UnAssignedBeatRequestFromJson(
        Map<String, dynamic> json) =>
    UnAssignedBeatRequest(
      action: json['action'] as String,
      zoneId: (json['zone_id'] as num).toInt(),
      wardId: (json['ward_id'] as num).toInt(),
    );

Map<String, dynamic> _$UnAssignedBeatRequestToJson(
        UnAssignedBeatRequest instance) =>
    <String, dynamic>{
      'action': instance.action,
      'zone_id': instance.zoneId,
      'ward_id': instance.wardId,
    };
