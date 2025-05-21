// response/view_beats_by_emp_response.dart

import 'package:json_annotation/json_annotation.dart';

part 'view_beats_by_emp_response.g.dart';

@JsonSerializable()
class ViewBeatsByEmpResponse {
  final bool? status;
  final String? message;
  final ViewBeatsResult? result;

  ViewBeatsByEmpResponse({this.status, this.message, this.result});

  factory ViewBeatsByEmpResponse.fromJson(Map<String, dynamic> json) => _$ViewBeatsByEmpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ViewBeatsByEmpResponseToJson(this);
}

@JsonSerializable()
class ViewBeatsResult {
  final List<BeatData>? data;

  ViewBeatsResult({this.data});

  factory ViewBeatsResult.fromJson(Map<String, dynamic> json) => _$ViewBeatsResultFromJson(json);
  Map<String, dynamic> toJson() => _$ViewBeatsResultToJson(this);
}

@JsonSerializable()
class BeatData {
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
  @JsonKey(name: 'working_status')
  final String? workingStatus;
  final String? type;
  @JsonKey(name: 'area_type')
  final String? areaType;
  final String? color;
  @JsonKey(name: 'main_beet_name')
  final String? mainBeetName;
  @JsonKey(name: 'sub_beet_no')
  final String? subBeetNo;
  @JsonKey(name: 'sub_beet_name')
  final String? subBeetName;
  @JsonKey(name: 'min_distance')
  final int? minDistance;
  @JsonKey(name: 'max_distance')
  final int? maxDistance;
  final int? distance;
  @JsonKey(name: 'date_time')
  final String? dateTime;
  @JsonKey(name: 'lat_lng')
  final LatLngData? latLngData;

  BeatData({
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
    this.workingStatus,
    this.type,
    this.areaType,
    this.color,
    this.mainBeetName,
    this.subBeetNo,
    this.subBeetName,
    this.minDistance,
    this.maxDistance,
    this.distance,
    this.dateTime,
    this.latLngData,
  });

  factory BeatData.fromJson(Map<String, dynamic> json) => _$BeatDataFromJson(json);
  Map<String, dynamic> toJson() => _$BeatDataToJson(this);
}

@JsonSerializable()
class LatLngData {
  final String? type;
  final List<List<List<List<double>>>>? coordinates;

  LatLngData({this.type, this.coordinates});

  factory LatLngData.fromJson(Map<String, dynamic> json) => _$LatLngDataFromJson(json);
  Map<String, dynamic> toJson() => _$LatLngDataToJson(this);
}
