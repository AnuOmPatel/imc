import 'package:json_annotation/json_annotation.dart';

part 'unassigned_beat_request.g.dart';

@JsonSerializable()
class UnAssignedBeatRequest{
  final String action;
  @JsonKey(name: 'zone_id')
  final int zoneId;
  @JsonKey(name: 'ward_id')
  final int wardId;

  UnAssignedBeatRequest({
    required this.action,
    required this.zoneId,
    required this.wardId,
  });

  factory UnAssignedBeatRequest.fromJson(Map<String, dynamic> json) =>
      _$UnAssignedBeatRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UnAssignedBeatRequestToJson(this);
}