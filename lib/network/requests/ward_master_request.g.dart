// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ward_master_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WardMasterRequestByZone _$WardMasterRequestByZoneFromJson(
        Map<String, dynamic> json) =>
    WardMasterRequestByZone(
      action: json['action'] as String,
      zone_id: json['zone_id'] as String,
    );

Map<String, dynamic> _$WardMasterRequestByZoneToJson(
        WardMasterRequestByZone instance) =>
    <String, dynamic>{
      'action': instance.action,
      'zone_id': instance.zone_id,
    };
