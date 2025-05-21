import 'package:json_annotation/json_annotation.dart';

part 'ward_master_response_by_zones.g.dart';

@JsonSerializable()
class WardMasterResponseByZone {
  final bool? status;
  final String? message;
  final WardResult? result;

  WardMasterResponseByZone({this.status, this.message, this.result});

  factory WardMasterResponseByZone.fromJson(Map<String, dynamic> json) =>
      _$WardMasterResponseByZoneFromJson(json);
  Map<String, dynamic> toJson() => _$WardMasterResponseByZoneToJson(this);
}

@JsonSerializable()
class WardResult {
  final List<Ward>? data;

  WardResult({this.data});

  factory WardResult.fromJson(Map<String, dynamic> json) =>
      _$WardResultFromJson(json);
  Map<String, dynamic> toJson() => _$WardResultToJson(this);
}

@JsonSerializable()
class Ward {
  @JsonKey(name: 'ward_id')
  final int? wardId;

  @JsonKey(name: 'ward_name')
  final String? wardName;

  Ward({this.wardId, this.wardName});

  factory Ward.fromJson(Map<String, dynamic> json) => _$WardFromJson(json);
  Map<String, dynamic> toJson() => _$WardToJson(this);
}
