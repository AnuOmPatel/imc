// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_beat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeatResponse _$BeatResponseFromJson(Map<String, dynamic> json) => BeatResponse(
      status: json['status'] as bool,
      message: json['message'] as String,
      result: BeatResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BeatResponseToJson(BeatResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'result': instance.result,
    };

BeatResult _$BeatResultFromJson(Map<String, dynamic> json) => BeatResult(
      data: (json['data'] as List<dynamic>)
          .map((e) => BeatData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BeatResultToJson(BeatResult instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

BeatData _$BeatDataFromJson(Map<String, dynamic> json) => BeatData(
      zoneId: (json['zone_id'] as num).toInt(),
      zoneName: json['zone_name'] as String,
      wardId: (json['ward_id'] as num).toInt(),
      wardName: json['ward_name'] as String,
      beetId: (json['beet_id'] as num).toInt(),
      beetName: json['beet_name'] as String,
      startLocation: json['start_location'] as String,
      endLocation: json['end_location'] as String,
      type: json['type'] as String,
      color: json['color'] as String,
      mainBeatName: json['main_beet_name'] as String,
      subBeetNo: json['sub_beet_no'] as String,
      subBeetName: json['sub_beet_name'] as String,
      distance: (json['distance'] as num).toInt(),
      latLng: LatLngData.fromJson(json['lat_lng'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BeatDataToJson(BeatData instance) => <String, dynamic>{
      'zone_id': instance.zoneId,
      'zone_name': instance.zoneName,
      'ward_id': instance.wardId,
      'ward_name': instance.wardName,
      'beet_id': instance.beetId,
      'beet_name': instance.beetName,
      'start_location': instance.startLocation,
      'end_location': instance.endLocation,
      'type': instance.type,
      'color': instance.color,
      'main_beet_name': instance.mainBeatName,
      'sub_beet_no': instance.subBeetNo,
      'sub_beet_name': instance.subBeetName,
      'distance': instance.distance,
      'lat_lng': instance.latLng,
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
