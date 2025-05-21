// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'near_by_employees_with_beat_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NearByEmployeesWithBeatRequest _$NearByEmployeesWithBeatRequestFromJson(
        Map<String, dynamic> json) =>
    NearByEmployeesWithBeatRequest(
      action: json['action'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => (e as List<dynamic>)
                  .map((e) => (e as List<dynamic>)
                      .map((e) => (e as num).toDouble())
                      .toList())
                  .toList())
              .toList())
          .toList(),
    );

Map<String, dynamic> _$NearByEmployeesWithBeatRequestToJson(
        NearByEmployeesWithBeatRequest instance) =>
    <String, dynamic>{
      'action': instance.action,
      'coordinates': instance.coordinates,
    };
