// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_beat_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatedBeatRequest _$CreatedBeatRequestFromJson(Map<String, dynamic> json) =>
    CreatedBeatRequest(
      action: json['action'] as String,
      zoneId: (json['zone_id'] as num).toInt(),
      wardId: (json['ward_id'] as num).toInt(),
    );

Map<String, dynamic> _$CreatedBeatRequestToJson(CreatedBeatRequest instance) =>
    <String, dynamic>{
      'action': instance.action,
      'zone_id': instance.zoneId,
      'ward_id': instance.wardId,
    };
