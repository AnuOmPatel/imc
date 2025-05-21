// request/view_beats_by_emp_request.dart

import 'package:json_annotation/json_annotation.dart';

part 'view_beat_by_emp_request.g.dart';

@JsonSerializable()
class ViewBeatsByEmpRequest {
  final String action;
  @JsonKey(name: 'employee_id')
  final int employeeId;

  ViewBeatsByEmpRequest({
    required this.action,
    required this.employeeId,
  });

  factory ViewBeatsByEmpRequest.fromJson(Map<String, dynamic> json) =>
      _$ViewBeatsByEmpRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ViewBeatsByEmpRequestToJson(this);
}
