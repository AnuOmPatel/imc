import 'package:json_annotation/json_annotation.dart';

part 'near_by_beats_response.g.dart';

@JsonSerializable()
class NearByBeatsResponse {
  final bool? status;
  final String? message;
  final Result? result;

  const NearByBeatsResponse({
    this.status,
    this.message,
    this.result,
  });

  factory NearByBeatsResponse.fromJson(Map<String, dynamic> json) =>
      _$NearByBeatsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NearByBeatsResponseToJson(this);
}

@JsonSerializable()
class Result {
  final List<Data>? data;
  final List<Beet>? beet;

  const Result({
    this.data,
    this.beet,
  });

  factory Result.fromJson(Map<String, dynamic> json) =>
      _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'zone_id')
  final int? zoneId;
  @JsonKey(name: 'zone_name')
  final String? zoneName;
  @JsonKey(name: 'ward_id')
  final int? wardId;
  @JsonKey(name: 'ward_name')
  final String? wardName;
  @JsonKey(name: 'beet_id')
  final dynamic? beetId;
  @JsonKey(name: 'beet_name')
  final String? beetName;
  @JsonKey(name: 'incharge_name')
  final String? inchargeName;
  @JsonKey(name: 'ho_id')
  final int? hoId;
  @JsonKey(name: 'ho_name')
  final String? hoName;
  @JsonKey(name: 'csi_id')
  final int? csiId;
  @JsonKey(name: 'csi_name')
  final String? csiName;
  @JsonKey(name: 'daroga_id')
  final int? darogaId;
  @JsonKey(name: 'daroga_name')
  final String? darogaName;
  @JsonKey(name: 'employee_id')
  final dynamic? employeeId;
  @JsonKey(name: 'employee_name')
  final String? employeeName;
  @JsonKey(name: 'father_name')
  final String? fatherName;
  @JsonKey(name: 'mobile_no')
  final dynamic? mobileNo;
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
  @JsonKey(name: 'start_location')
  final String? startLocation;
  @JsonKey(name: 'start_lat')
  final dynamic? startLat;
  @JsonKey(name: 'start_lng')
  final dynamic? startLng;
  @JsonKey(name: 'end_location')
  final String? endLocation;
  @JsonKey(name: 'end_lat')
  final dynamic? endLat;
  @JsonKey(name: 'end_lng')
  final dynamic? endLng;
  @JsonKey(name: 'area_covered')
  final String? areaCovered;
  @JsonKey(name: 'date_time')
  final String? dateTime;

  const Data({
    this.zoneId,
    this.zoneName,
    this.wardId,
    this.wardName,
    this.beetId,
    this.beetName,
    this.inchargeName,
    this.hoId,
    this.hoName,
    this.csiId,
    this.csiName,
    this.darogaId,
    this.darogaName,
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
    this.startLocation,
    this.startLat,
    this.startLng,
    this.endLocation,
    this.endLat,
    this.endLng,
    this.areaCovered,
    this.dateTime,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Beet {
  @JsonKey(name: 'zone_id')
  final int? zoneId;
  @JsonKey(name: 'zone_name')
  final String? zoneName;
  @JsonKey(name: 'ward_id')
  final int? wardId;
  @JsonKey(name: 'ward_name')
  final String? wardName;
  @JsonKey(name: 'beet_id')
  final dynamic? beetId;
  @JsonKey(name: 'beet_name')
  final String? beetName;
  @JsonKey(name: 'start_location')
  final String? startLocation;
  @JsonKey(name: 'end_location')
  final String? endLocation;
  final String? type;
  @JsonKey(name: 'lat_lng')
  final LatLng? latLng;
  final String? color;
  final dynamic? distance;

  const Beet({
    this.zoneId,
    this.zoneName,
    this.wardId,
    this.wardName,
    this.beetId,
    this.beetName,
    this.startLocation,
    this.endLocation,
    this.type,
    this.latLng,
    this.color,
    this.distance,
  });

  factory Beet.fromJson(Map<String, dynamic> json) =>
      _$BeetFromJson(json);

  Map<String, dynamic> toJson() => _$BeetToJson(this);
}

@JsonSerializable()
class LatLng {
  final String? type;
  final List<dynamic>? coordinates;

  const LatLng({
    this.type,
    this.coordinates,
  });

  factory LatLng.fromJson(Map<String, dynamic> json) =>
      _$LatLngFromJson(json);

  Map<String, dynamic> toJson() => _$LatLngToJson(this);
}

@JsonSerializable()
class Coordinates {
  final double? latitude;
  final double? longitude;

  const Coordinates({
    this.latitude,
    this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}
