import 'package:json_annotation/json_annotation.dart';

part 'created_beat_response.g.dart';

@JsonSerializable()
class BeatResponse {
  final bool status;
  final String message;
  final BeatResult result;

  BeatResponse({required this.status, required this.message, required this.result});

  factory BeatResponse.fromJson(Map<String, dynamic> json) => _$BeatResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BeatResponseToJson(this);
}

@JsonSerializable()
class BeatResult {
  final List<BeatData> data;

  BeatResult({required this.data});

  factory BeatResult.fromJson(Map<String, dynamic> json) => _$BeatResultFromJson(json);
  Map<String, dynamic> toJson() => _$BeatResultToJson(this);
}

@JsonSerializable()
class BeatData {
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

  @JsonKey(name: 'main_beet_name')
  final String mainBeatName;

  @JsonKey(name: 'sub_beet_no')
  final String subBeetNo;

  @JsonKey(name: 'sub_beet_name')
  final String subBeetName;

  final int distance;

  @JsonKey(name: 'lat_lng')
  final LatLngData latLng;

  BeatData({
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
    required this.mainBeatName,
    required this.subBeetNo,
    required this.subBeetName,
    required this.distance,
    required this.latLng,
  });

  factory BeatData.fromJson(Map<String, dynamic> json) => _$BeatDataFromJson(json);
  Map<String, dynamic> toJson() => _$BeatDataToJson(this);
}

@JsonSerializable()
class LatLngData {
  final String type;
  final List<List<List<List<double>>>> coordinates;

  LatLngData({
    required this.type,
    required this.coordinates,
  });

  factory LatLngData.fromJson(Map<String, dynamic> json) => _$LatLngDataFromJson(json);
  Map<String, dynamic> toJson() => _$LatLngDataToJson(this);
}
