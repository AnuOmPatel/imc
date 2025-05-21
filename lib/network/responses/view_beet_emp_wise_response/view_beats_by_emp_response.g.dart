// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_beats_by_emp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewBeatsByEmpResponse _$ViewBeatsByEmpResponseFromJson(
        Map<String, dynamic> json) =>
    ViewBeatsByEmpResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      result: json['result'] == null
          ? null
          : ViewBeatsResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ViewBeatsByEmpResponseToJson(
        ViewBeatsByEmpResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'result': instance.result,
    };

ViewBeatsResult _$ViewBeatsResultFromJson(Map<String, dynamic> json) =>
    ViewBeatsResult(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BeatData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ViewBeatsResultToJson(ViewBeatsResult instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

BeatData _$BeatDataFromJson(Map<String, dynamic> json) => BeatData(
      zoneId: (json['zone_id'] as num?)?.toInt(),
      zoneName: json['zone_name'] as String?,
      wardId: (json['ward_id'] as num?)?.toInt(),
      wardName: json['ward_name'] as String?,
      beetId: (json['beet_id'] as num?)?.toInt(),
      beetName: json['beet_name'] as String?,
      startLocation: json['start_location'] as String?,
      endLocation: json['end_location'] as String?,
      shiftStartTime: json['shift_start_time'] as String?,
      shiftEndTime: json['shift_end_time'] as String?,
      workingStatus: json['working_status'] as String?,
      type: json['type'] as String?,
      areaType: json['area_type'] as String?,
      color: json['color'] as String?,
      mainBeetName: json['main_beet_name'] as String?,
      subBeetNo: json['sub_beet_no'] as String?,
      subBeetName: json['sub_beet_name'] as String?,
      minDistance: (json['min_distance'] as num?)?.toInt(),
      maxDistance: (json['max_distance'] as num?)?.toInt(),
      distance: (json['distance'] as num?)?.toInt(),
      dateTime: json['date_time'] as String?,
      latLngData: json['lat_lng'] == null
          ? null
          : LatLngData.fromJson(json['lat_lng'] as Map<String, dynamic>),
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
      'shift_start_time': instance.shiftStartTime,
      'shift_end_time': instance.shiftEndTime,
      'working_status': instance.workingStatus,
      'type': instance.type,
      'area_type': instance.areaType,
      'color': instance.color,
      'main_beet_name': instance.mainBeetName,
      'sub_beet_no': instance.subBeetNo,
      'sub_beet_name': instance.subBeetName,
      'min_distance': instance.minDistance,
      'max_distance': instance.maxDistance,
      'distance': instance.distance,
      'date_time': instance.dateTime,
      'lat_lng': instance.latLngData,
    };

LatLngData _$LatLngDataFromJson(Map<String, dynamic> json) => LatLngData(
      type: json['type'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>)
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
