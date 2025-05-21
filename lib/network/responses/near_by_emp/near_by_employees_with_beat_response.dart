import 'package:json_annotation/json_annotation.dart';

part 'near_by_employees_with_beat_response.g.dart';

@JsonSerializable()
class NearByEmployeesWithBeatResponse {
  final bool? status;
  final String? message;
  final NearbyBeatsResult? result;

  const NearByEmployeesWithBeatResponse({
    this.status,
    this.message,
    this.result,
  });

  factory NearByEmployeesWithBeatResponse.fromJson(Map<String, dynamic> json) =>
      _$NearByEmployeesWithBeatResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NearByEmployeesWithBeatResponseToJson(this);
}

@JsonSerializable()
class NearbyBeatsResult {
  final List<BeetData>? data;

  NearbyBeatsResult({this.data});

  factory NearbyBeatsResult.fromJson(Map<String, dynamic> json) =>
      _$NearbyBeatsResultFromJson(json);
  Map<String, dynamic> toJson() => _$NearbyBeatsResultToJson(this);
}

@JsonSerializable()
class BeetData {
  @JsonKey(name: 'zone_id')
  final int? zoneId;
  @JsonKey(name: 'zone_name')
  final String? zoneName;
  @JsonKey(name: 'ward_id')
  final int? wardId;
  @JsonKey(name: 'ward_name')
  final String? wardName;
  @JsonKey(name: 'beet_id')
  final int? beetId;
  @JsonKey(name: 'beet_name')
  final String? beetName;
  @JsonKey(name: 'start_location')
  final String? startLocation;
  @JsonKey(name: 'end_location')
  final String? endLocation;
  @JsonKey(name: 'shift_start_time')
  final String? shiftStartTime;
  @JsonKey(name: 'shift_end_time')
  final String? shiftEndTime;
  final String? type;
  final String? color;
  @JsonKey(name: 'area_type')
  final String? areaType;
  final int? distance;
  @JsonKey(name: 'lat_lng')
  final LatLngData? latLngData;
  @JsonKey(name: 'emp_data')
  final List<EmployeeData>? empData;

  const BeetData({
    this.zoneId,
    this.zoneName,
    this.wardId,
    this.wardName,
    this.beetId,
    this.beetName,
    this.startLocation,
    this.endLocation,
    this.shiftStartTime,
    this.shiftEndTime,
    this.type,
    this.color,
    this.areaType,
    this.distance,
    this.latLngData,
    this.empData,
  });

  factory BeetData.fromJson(Map<String, dynamic> json) => _$BeetDataFromJson(json);
  Map<String, dynamic> toJson() => _$BeetDataToJson(this);
}

@JsonSerializable()
class LatLngData {
  final String? type;
  final List<List<List<List<double>>>>? coordinates;

  const LatLngData({
    this.type,
    this.coordinates,
  });

  factory LatLngData.fromJson(Map<String, dynamic> json) => _$LatLngDataFromJson(json);
  Map<String, dynamic> toJson() => _$LatLngDataToJson(this);
}

@JsonSerializable()
class EmployeeData {
  @JsonKey(name: 'emp_id')
  final int? empId;

  @JsonKey(name: 'employee_id')
  final String? employeeId;

  @JsonKey(name: 'employee_name')
  final String? employeeName;

  @JsonKey(name: 'father_name')
  final String? fatherName;

  @JsonKey(name: 'mobile_no')
  final int? mobileNo;

  @JsonKey(name: 'position_id')
  final int? positionId;

  @JsonKey(name: 'employee_position')
  final String? employeePosition;

  @JsonKey(name: 'employee_type')
  final String? employeeType;

  final String? gender;

  @JsonKey(name: 'week_off_day')
  final String? weekOffDay;

  @JsonKey(name: 'morning_shift')
  final String? morningShift;

  @JsonKey(name: 'afternoon_shift')
  final String? afternoonShift;

  @JsonKey(name: 'evening_shift')
  final String? eveningShift;

  @JsonKey(name: 'night_shift')
  final String? nightShift;

  @JsonKey(name: 'working_shift')
  final String? workingShift;

  @JsonKey(name: 'area_covered')
  final String? areaCovered;

  @JsonKey(name: 'working_day')
  final List<String>? workingDay;

  @JsonKey(name: 'working_status')
  final String? workingStatus;

  @JsonKey(name: 'employee_photo')
  final String? employeePhoto;

  @JsonKey(name: 'main_beet_name')
  final String? mainBeatName;

  @JsonKey(name: 'sub_beet_no')
  final String? subBeatNumber;

  @JsonKey(name: 'sub_beet_name')
  final String? subBeatName;

  @JsonKey(name: 'date_time')
  final String? dateTime;


  EmployeeData({
    this.empId,
    this.employeeId,
    this.employeeName,
    this.fatherName,
    this.mobileNo,
    this.positionId,
    this.employeePosition,
    this.employeeType,
    this.gender,
    this.weekOffDay,
    this.morningShift,
    this.afternoonShift,
    this.eveningShift,
    this.nightShift,
    this.workingShift,
    this.areaCovered,
    this.workingDay,
    this.workingStatus,
    this.employeePhoto,
    this.mainBeatName,
    this.subBeatNumber,
    this.subBeatName,
    this.dateTime,
  });

  factory EmployeeData.fromJson(Map<String, dynamic> json) => _$EmployeeDataFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeeDataToJson(this);
}
