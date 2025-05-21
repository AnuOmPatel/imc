import 'package:json_annotation/json_annotation.dart';

part 'un_assigned_beat_response.g.dart';

@JsonSerializable()
class UnAssignedBeatResponse {
  final bool status;
  final String message;
  final BeetResult result;

  UnAssignedBeatResponse({
    required this.status,
    required this.message,
    required this.result,
  });

  factory UnAssignedBeatResponse.fromJson(Map<String, dynamic> json) =>
      _$UnAssignedBeatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnAssignedBeatResponseToJson(this);
}

@JsonSerializable()
class BeetResult {
  final List<UnAssignedBeetData> data;

  BeetResult({required this.data});

  factory BeetResult.fromJson(Map<String, dynamic> json) =>
      _$BeetResultFromJson(json);

  Map<String, dynamic> toJson() => _$BeetResultToJson(this);
}

@JsonSerializable()
class UnAssignedBeetData {
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
  final int distance;

  @JsonKey(name: 'lat_lng')
  final LatLngData latLng;

  final String color;

  @JsonKey(name: 'date_time')
  final String dateTime;

  UnAssignedBeetData({
    required this.zoneId,
    required this.zoneName,
    required this.wardId,
    required this.wardName,
    required this.beetId,
    required this.beetName,
    required this.startLocation,
    required this.endLocation,
    required this.type,
    required this.distance,
    required this.latLng,
    required this.color,
    required this.dateTime,
  });

  factory UnAssignedBeetData.fromJson(Map<String, dynamic> json) =>
      _$UnAssignedBeetDataFromJson(json);

  Map<String, dynamic> toJson() => _$UnAssignedBeetDataToJson(this);
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
