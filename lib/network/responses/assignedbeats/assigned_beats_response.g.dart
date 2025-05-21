// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_beats_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignedBeatResponse _$AssignedBeatResponseFromJson(
        Map<String, dynamic> json) =>
    AssignedBeatResponse(
      status: json['status'] as bool,
      message: json['message'] as String,
      result:
          AssignedBeatResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AssignedBeatResponseToJson(
        AssignedBeatResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'result': instance.result,
    };

AssignedBeatResult _$AssignedBeatResultFromJson(Map<String, dynamic> json) =>
    AssignedBeatResult(
      data: (json['data'] as List<dynamic>)
          .map((e) => AssignedBeatData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AssignedBeatResultToJson(AssignedBeatResult instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AssignedBeatData _$AssignedBeatDataFromJson(Map<String, dynamic> json) =>
    AssignedBeatData(
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
      distance: json['distance'] as String,
      dateTime: json['date_time'] as String,
      id: json['id'] as String,
      employeeId: json['employee_id'] as String,
      employeeName: json['employee_name'] as String,
      fatherName: json['father_name'] as String,
      mobileNo: (json['mobile_no'] as num).toInt(),
      aadharNo: (json['aadhar_no'] as num).toInt(),
      employeeType: json['employee_type'] as String,
      gender: json['gender'] as String,
      weekOffDay: json['week_off_day'] as String,
      mainBeetName: json['main_beet_name'] as String,
      subBeetNo: json['sub_beet_no'] as String,
      subBeetName: json['sub_beet_name'] as String,
      latLng: LatLngData.fromJson(json['lat_lng'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AssignedBeatDataToJson(AssignedBeatData instance) =>
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
      'color': instance.color,
      'distance': instance.distance,
      'date_time': instance.dateTime,
      'id': instance.id,
      'employee_id': instance.employeeId,
      'employee_name': instance.employeeName,
      'father_name': instance.fatherName,
      'mobile_no': instance.mobileNo,
      'aadhar_no': instance.aadharNo,
      'employee_type': instance.employeeType,
      'gender': instance.gender,
      'week_off_day': instance.weekOffDay,
      'main_beet_name': instance.mainBeetName,
      'sub_beet_no': instance.subBeetNo,
      'sub_beet_name': instance.subBeetName,
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
