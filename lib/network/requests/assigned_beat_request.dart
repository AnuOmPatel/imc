import 'package:json_annotation/json_annotation.dart';

part 'assigned_beat_request.g.dart';

@JsonSerializable()
class AssignedBeatRequest{
  final String action;
  @JsonKey(name: 'zone_id')
  final int zoneId;
  @JsonKey(name: 'ward_id')
  final int wardId;

  AssignedBeatRequest({
    required this.action,
    required this.zoneId,
    required this.wardId,
  });

  factory AssignedBeatRequest.fromJson(Map<String, dynamic> json) =>
      _$AssignedBeatRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AssignedBeatRequestToJson(this);
}