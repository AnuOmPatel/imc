// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'near_by_beats_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NearByBeatsResponse _$NearByBeatsResponseFromJson(Map<String, dynamic> json) =>
    NearByBeatsResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NearByBeatsResponseToJson(
        NearByBeatsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      beet: (json['beet'] as List<dynamic>?)
          ?.map((e) => Beet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'data': instance.data,
      'beet': instance.beet,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      zoneId: (json['zone_id'] as num?)?.toInt(),
      zoneName: json['zone_name'] as String?,
      wardId: (json['ward_id'] as num?)?.toInt(),
      wardName: json['ward_name'] as String?,
      beetId: json['beet_id'],
      beetName: json['beet_name'] as String?,
      inchargeName: json['incharge_name'] as String?,
      hoId: (json['ho_id'] as num?)?.toInt(),
      hoName: json['ho_name'] as String?,
      csiId: (json['csi_id'] as num?)?.toInt(),
      csiName: json['csi_name'] as String?,
      darogaId: (json['daroga_id'] as num?)?.toInt(),
      darogaName: json['daroga_name'] as String?,
      employeeId: json['employee_id'],
      employeeName: json['employee_name'] as String?,
      fatherName: json['father_name'] as String?,
      mobileNo: json['mobile_no'],
      positionId: (json['position_id'] as num?)?.toInt(),
      employeePosition: json['employee_position'] as String?,
      employeeType: json['employee_type'] as String?,
      gender: json['gender'] as String?,
      weekOffDay: json['week_off_day'] as String?,
      morningShift: json['morning_shift'] as String?,
      afternoonShift: json['afternoon_shift'] as String?,
      eveningShift: json['evening_shift'] as String?,
      nightShift: json['night_shift'] as String?,
      workingShift: json['working_shift'] as String?,
      startLocation: json['start_location'] as String?,
      startLat: json['start_lat'],
      startLng: json['start_lng'],
      endLocation: json['end_location'] as String?,
      endLat: json['end_lat'],
      endLng: json['end_lng'],
      areaCovered: json['area_covered'] as String?,
      dateTime: json['date_time'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'zone_id': instance.zoneId,
      'zone_name': instance.zoneName,
      'ward_id': instance.wardId,
      'ward_name': instance.wardName,
      'beet_id': instance.beetId,
      'beet_name': instance.beetName,
      'incharge_name': instance.inchargeName,
      'ho_id': instance.hoId,
      'ho_name': instance.hoName,
      'csi_id': instance.csiId,
      'csi_name': instance.csiName,
      'daroga_id': instance.darogaId,
      'daroga_name': instance.darogaName,
      'employee_id': instance.employeeId,
      'employee_name': instance.employeeName,
      'father_name': instance.fatherName,
      'mobile_no': instance.mobileNo,
      'position_id': instance.positionId,
      'employee_position': instance.employeePosition,
      'employee_type': instance.employeeType,
      'gender': instance.gender,
      'week_off_day': instance.weekOffDay,
      'morning_shift': instance.morningShift,
      'afternoon_shift': instance.afternoonShift,
      'evening_shift': instance.eveningShift,
      'night_shift': instance.nightShift,
      'working_shift': instance.workingShift,
      'start_location': instance.startLocation,
      'start_lat': instance.startLat,
      'start_lng': instance.startLng,
      'end_location': instance.endLocation,
      'end_lat': instance.endLat,
      'end_lng': instance.endLng,
      'area_covered': instance.areaCovered,
      'date_time': instance.dateTime,
    };

Beet _$BeetFromJson(Map<String, dynamic> json) => Beet(
      zoneId: (json['zone_id'] as num?)?.toInt(),
      zoneName: json['zone_name'] as String?,
      wardId: (json['ward_id'] as num?)?.toInt(),
      wardName: json['ward_name'] as String?,
      beetId: json['beet_id'],
      beetName: json['beet_name'] as String?,
      startLocation: json['start_location'] as String?,
      endLocation: json['end_location'] as String?,
      type: json['type'] as String?,
      latLng: json['lat_lng'] == null
          ? null
          : LatLng.fromJson(json['lat_lng'] as Map<String, dynamic>),
      color: json['color'] as String?,
      distance: json['distance'],
    );

Map<String, dynamic> _$BeetToJson(Beet instance) => <String, dynamic>{
      'zone_id': instance.zoneId,
      'zone_name': instance.zoneName,
      'ward_id': instance.wardId,
      'ward_name': instance.wardName,
      'beet_id': instance.beetId,
      'beet_name': instance.beetName,
      'start_location': instance.startLocation,
      'end_location': instance.endLocation,
      'type': instance.type,
      'lat_lng': instance.latLng,
      'color': instance.color,
      'distance': instance.distance,
    };

LatLng _$LatLngFromJson(Map<String, dynamic> json) => LatLng(
      type: json['type'] as String?,
      coordinates: json['coordinates'] as List<dynamic>?,
    );

Map<String, dynamic> _$LatLngToJson(LatLng instance) => <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) => Coordinates(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
