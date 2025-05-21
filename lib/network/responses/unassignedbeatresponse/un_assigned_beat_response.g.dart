// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'un_assigned_beat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnAssignedBeatResponse _$UnAssignedBeatResponseFromJson(
        Map<String, dynamic> json) =>
    UnAssignedBeatResponse(
      status: json['status'] as bool,
      message: json['message'] as String,
      result: BeetResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UnAssignedBeatResponseToJson(
        UnAssignedBeatResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'result': instance.result,
    };

BeetResult _$BeetResultFromJson(Map<String, dynamic> json) => BeetResult(
      data: (json['data'] as List<dynamic>)
          .map((e) => UnAssignedBeetData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BeetResultToJson(BeetResult instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

UnAssignedBeetData _$UnAssignedBeetDataFromJson(Map<String, dynamic> json) =>
    UnAssignedBeetData(
      zoneId: (json['zone_id'] as num).toInt(),
      zoneName: json['zone_name'] as String,
      wardId: (json['ward_id'] as num).toInt(),
      wardName: json['ward_name'] as String,
      beetId: (json['beet_id'] as num).toInt(),
      beetName: json['beet_name'] as String,
      startLocation: json['start_location'] as String,
      endLocation: json['end_location'] as String,
      type: json['type'] as String,
      distance: (json['distance'] as num).toInt(),
      latLng: LatLngData.fromJson(json['lat_lng'] as Map<String, dynamic>),
      color: json['color'] as String,
      dateTime: json['date_time'] as String,
    );

Map<String, dynamic> _$UnAssignedBeetDataToJson(UnAssignedBeetData instance) =>
    <String, dynamic>{
      'zone_id': instance.zoneId,
      'zone_name': instance.zoneName,
      'ward_id': instance.wardId,
      'ward_name': instance.wardName,
      'beet_id': instance.beetId,
      'beet_name': instance.beetName,
      'start_location': instance.startLocation,
      'end_location': instance.endLocation,
      'type': instance.type,
      'distance': instance.distance,
      'lat_lng': instance.latLng,
      'color': instance.color,
      'date_time': instance.dateTime,
    };

LatLngData _$LatLngDataFromJson(Map<String, dynamic> json) => LatLngData(
      type: json['type'] as String,
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

Map<String, dynamic> _$LatLngDataToJson(LatLngData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };
