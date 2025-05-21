import 'package:json_annotation/json_annotation.dart';

part 'emp_list_request.g.dart';

@JsonSerializable()
class EmployeeListRequest {
  final String action;
  @JsonKey(name: 'zone_id')
  final int zoneId;
  @JsonKey(name: 'ward_id')
  final int wardId;

  EmployeeListRequest({
    required this.action,
    required this.zoneId,
    required this.wardId,
  });

  factory EmployeeListRequest.fromJson(Map<String, dynamic> json) =>
      _$EmployeeListRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeListRequestToJson(this);
}
