import 'package:json_annotation/json_annotation.dart';

part 'created_beat_list.g.dart';

@JsonSerializable()
class CreatedBeatRequest{
  final String action;
  @JsonKey(name: 'zone_id')
  final int zoneId;
  @JsonKey(name: 'ward_id')
  final int wardId;

  CreatedBeatRequest({
    required this.action,
    required this.zoneId,
    required this.wardId,
  });

  factory CreatedBeatRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatedBeatRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreatedBeatRequestToJson(this);
}