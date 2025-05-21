import 'package:json_annotation/json_annotation.dart';

part 'dash_board_data_response.g.dart';

@JsonSerializable()
class DashBoardDataResponse {
  final bool? status;
  final String? message;
  final Result? result;

  const DashBoardDataResponse({
    this.status,
    this.message,
    this.result,
  });

  factory DashBoardDataResponse.fromJson(Map<String, dynamic> json) =>
      _$DashBoardDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DashBoardDataResponseToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: 'dashboard_data')
  final List<DashboardData>? dashboardData;

  const Result({
    this.dashboardData,
  });

  factory Result.fromJson(Map<String, dynamic> json) =>
      _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class DashboardData {
  @JsonKey(name: 'total_employees')
  final int? totalEmployees;
  @JsonKey(name: 'total_outsourced_employee')
  final int? totalOutsourcedEmployee;
  @JsonKey(name: 'total_beets_created')
  final int? totalBeetsCreated;
  @JsonKey(name: 'total_assigned_beets')
  final int? totalAssignedBeets;
  @JsonKey(name: 'total_third_party_beets')
  final int? totalThirdPartyBeets;
  @JsonKey(name: 'total_unassigned_beets')
  final int? totalUnassignedBeets;
  @JsonKey(name: 'total_distance_covered')
  final int? totalDistanceCovered;
  @JsonKey(name: 'mini_length_beet')
  final int? miniLengthBeet;
  @JsonKey(name: 'max_length_beet')
  final int? maxLengthBeet;
  @JsonKey(name: 'total_relivers')
  final int? totalRelivers;

  const DashboardData({
    this.totalEmployees,
    this.totalOutsourcedEmployee,
    this.totalBeetsCreated,
    this.totalAssignedBeets,
    this.totalThirdPartyBeets,
    this.totalUnassignedBeets,
    this.totalDistanceCovered,
    this.miniLengthBeet,
    this.maxLengthBeet,
    this.totalRelivers,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardDataToJson(this);
}
