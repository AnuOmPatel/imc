// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ward_master_response_by_zones.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WardMasterResponseByZone _$WardMasterResponseByZoneFromJson(
        Map<String, dynamic> json) =>
    WardMasterResponseByZone(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      result: json['result'] == null
          ? null
          : WardResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WardMasterResponseByZoneToJson(
        WardMasterResponseByZone instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'result': instance.result,
    };

WardResult _$WardResultFromJson(Map<String, dynamic> json) => WardResult(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Ward.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WardResultToJson(WardResult instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Ward _$WardFromJson(Map<String, dynamic> json) => Ward(
      wardId: (json['ward_id'] as num?)?.toInt(),
      wardName: json['ward_name'] as String?,
    );

Map<String, dynamic> _$WardToJson(Ward instance) => <String, dynamic>{
      'ward_id': instance.wardId,
      'ward_name': instance.wardName,
    };
