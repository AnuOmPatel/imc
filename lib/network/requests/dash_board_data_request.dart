import 'package:json_annotation/json_annotation.dart';

part 'dash_board_data_request.g.dart';

@JsonSerializable()
class DashBoardDataRequest {
  final String? action;
  @JsonKey(name: 'zone_id')
  final int? zoneId;
  @JsonKey(name: 'ward_id')
  final int? wardId;
  @JsonKey(name: 'employee_id')
  final int? employeeId;

  const DashBoardDataRequest({
    this.action,
    this.zoneId,
    this.wardId,
    this.employeeId,
  });

  factory DashBoardDataRequest.fromJson(Map<String, dynamic> json) =>
      _$DashBoardDataRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DashBoardDataRequestToJson(this);
}
