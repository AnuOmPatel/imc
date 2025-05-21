// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'near_by_beat_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NearByBeatRequest _$NearByBeatRequestFromJson(Map<String, dynamic> json) =>
    NearByBeatRequest(
      action: json['action'] as String,
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

Map<String, dynamic> _$NearByBeatRequestToJson(NearByBeatRequest instance) =>
    <String, dynamic>{
      'action': instance.action,
      'coordinates': instance.coordinates,
    };
