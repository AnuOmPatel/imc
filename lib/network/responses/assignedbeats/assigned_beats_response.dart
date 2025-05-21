import 'package:json_annotation/json_annotation.dart';

part 'assigned_beats_response.g.dart';

@JsonSerializable()
class AssignedBeatResponse {
  final bool status;
  final String message;
  final AssignedBeatResult result;

  AssignedBeatResponse({
    required this.status,
    required this.message,
    required this.result,
  });

  factory AssignedBeatResponse.fromJson(Map<String, dynamic> json) =>
      _$AssignedBeatResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AssignedBeatResponseToJson(this);
}

@JsonSerializable()
class AssignedBeatResult {
  final List<AssignedBeatData> data;

  AssignedBeatResult({required this.data});

  factory AssignedBeatResult.fromJson(Map<String, dynamic> json) =>
      _$AssignedBeatResultFromJson(json);
  Map<String, dynamic> toJson() => _$AssignedBeatResultToJson(this);
}

@JsonSerializable()
class AssignedBeatData {
  @JsonKey(name: 'zone_id')
  final int zoneId;

  @JsonKey(name: 'zone_name')
  final String zoneName;

  @JsonKey(name: 'ward_id')
  final int wardId;

  @JsonKey(name: 'ward_name')
  final String wardName;

  @JsonKey(name: 'beet_id')
  final int beetId;

  @JsonKey(name: 'beet_name')
  final String beetName;

  @JsonKey(name: 'start_location')
  final String startLocation;

  @JsonKey(name: 'end_location')
  final String endLocation;

  final String type;
  final String color;
  final String distance;

  @JsonKey(name: 'date_time')
  final String dateTime;

  final String id;

  @JsonKey(name: 'employee_id')
  final String employeeId;

  @JsonKey(name: 'employee_name')
  final String employeeName;

  @JsonKey(name: 'father_name')
  final String fatherName;

  @JsonKey(name: 'mobile_no')
  final int mobileNo;

  @JsonKey(name: 'aadhar_no')
  final int aadharNo;

  @JsonKey(name: 'employee_type')
  final String employeeType;

  final String gender;

  @JsonKey(name: 'week_off_day')
  final String weekOffDay;

  @JsonKey(name: 'main_beet_name')
  final String mainBeetName;

  @JsonKey(name: 'sub_beet_no')
  final String subBeetNo;

  @JsonKey(name: 'sub_beet_name')
  final String subBeetName;

  @JsonKey(name: 'lat_lng')
  final LatLngData latLng;

  AssignedBeatData({
    required this.zoneId,
    required this.zoneName,
    required this.wardId,
    required this.wardName,
    required this.beetId,
    required this.beetName,
    required this.startLocation,
    required this.endLocation,
    required this.type,
    required this.color,
    required this.distance,
    required this.dateTime,
    required this.id,
    required this.employeeId,
    required this.employeeName,
    required this.fatherName,
    required this.mobileNo,
    required this.aadharNo,
    required this.employeeType,
    required this.gender,
    required this.weekOffDay,
    required this.mainBeetName,
    required this.subBeetNo,
    required this.subBeetName,
    required this.latLng,
  });

  factory AssignedBeatData.fromJson(Map<String, dynamic> json) =>
      _$AssignedBeatDataFromJson(json);
  Map<String, dynamic> toJson() => _$AssignedBeatDataToJson(this);
}

@JsonSerializable()
class LatLngData {
  final String type;
  final List<List<List<List<double>>>> coordinates;

  LatLngData({
    required this.type,
    required this.coordinates,
  });

  factory LatLngData.fromJson(Map<String, dynamic> json) =>
      _$LatLngDataFromJson(json);
  Map<String, dynamic> toJson() => _$LatLngDataToJson(this);
}
