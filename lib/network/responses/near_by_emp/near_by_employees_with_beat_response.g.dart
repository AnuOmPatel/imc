// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'near_by_employees_with_beat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NearByEmployeesWithBeatResponse _$NearByEmployeesWithBeatResponseFromJson(
        Map<String, dynamic> json) =>
    NearByEmployeesWithBeatResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      result: json['result'] == null
          ? null
          : NearbyBeatsResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NearByEmployeesWithBeatResponseToJson(
        NearByEmployeesWithBeatResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'result': instance.result,
    };

NearbyBeatsResult _$NearbyBeatsResultFromJson(Map<String, dynamic> json) =>
    NearbyBeatsResult(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BeetData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NearbyBeatsResultToJson(NearbyBeatsResult instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

BeetData _$BeetDataFromJson(Map<String, dynamic> json) => BeetData(
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
      type: json['type'] as String?,
      color: json['color'] as String?,
      areaType: json['area_type'] as String?,
      distance: (json['distance'] as num?)?.toInt(),
      latLngData: json['lat_lng'] == null
          ? null
          : LatLngData.fromJson(json['lat_lng'] as Map<String, dynamic>),
      empData: (json['emp_data'] as List<dynamic>?)
          ?.map((e) => EmployeeData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BeetDataToJson(BeetData instance) => <String, dynamic>{
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
      'type': instance.type,
      'color': instance.color,
      'area_type': instance.areaType,
      'distance': instance.distance,
      'lat_lng': instance.latLngData,
      'emp_data': instance.empData,
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

EmployeeData _$EmployeeDataFromJson(Map<String, dynamic> json) => EmployeeData(
      empId: (json['emp_id'] as num?)?.toInt(),
      employeeId: json['employee_id'] as String?,
      employeeName: json['employee_name'] as String?,
      fatherName: json['father_name'] as String?,
      mobileNo: (json['mobile_no'] as num?)?.toInt(),
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
      areaCovered: json['area_covered'] as String?,
      workingDay: (json['working_day'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      workingStatus: json['working_status'] as String?,
      employeePhoto: json['employee_photo'] as String?,
      mainBeatName: json['main_beet_name'] as String?,
      subBeatNumber: json['sub_beet_no'] as String?,
      subBeatName: json['sub_beet_name'] as String?,
      dateTime: json['date_time'] as String?,
    );

Map<String, dynamic> _$EmployeeDataToJson(EmployeeData instance) =>
    <String, dynamic>{
      'emp_id': instance.empId,
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
      'area_covered': instance.areaCovered,
      'working_day': instance.workingDay,
      'working_status': instance.workingStatus,
      'employee_photo': instance.employeePhoto,
      'main_beet_name': instance.mainBeatName,
      'sub_beet_no': instance.subBeatNumber,
      'sub_beet_name': instance.subBeatName,
      'date_time': instance.dateTime,
    };
