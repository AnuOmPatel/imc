// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dash_board_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashBoardDataResponse _$DashBoardDataResponseFromJson(
        Map<String, dynamic> json) =>
    DashBoardDataResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashBoardDataResponseToJson(
        DashBoardDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      dashboardData: (json['dashboard_data'] as List<dynamic>?)
          ?.map((e) => DashboardData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'dashboard_data': instance.dashboardData,
    };

DashboardData _$DashboardDataFromJson(Map<String, dynamic> json) =>
    DashboardData(
      totalEmployees: (json['total_employees'] as num?)?.toInt(),
      totalOutsourcedEmployee:
          (json['total_outsourced_employee'] as num?)?.toInt(),
      totalBeetsCreated: (json['total_beets_created'] as num?)?.toInt(),
      totalAssignedBeets: (json['total_assigned_beets'] as num?)?.toInt(),
      totalThirdPartyBeets: (json['total_third_party_beets'] as num?)?.toInt(),
      totalUnassignedBeets: (json['total_unassigned_beets'] as num?)?.toInt(),
      totalDistanceCovered: (json['total_distance_covered'] as num?)?.toInt(),
      miniLengthBeet: (json['mini_length_beet'] as num?)?.toInt(),
      maxLengthBeet: (json['max_length_beet'] as num?)?.toInt(),
      totalRelivers: (json['total_relivers'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DashboardDataToJson(DashboardData instance) =>
    <String, dynamic>{
      'total_employees': instance.totalEmployees,
      'total_outsourced_employee': instance.totalOutsourcedEmployee,
      'total_beets_created': instance.totalBeetsCreated,
      'total_assigned_beets': instance.totalAssignedBeets,
      'total_third_party_beets': instance.totalThirdPartyBeets,
      'total_unassigned_beets': instance.totalUnassignedBeets,
      'total_distance_covered': instance.totalDistanceCovered,
      'mini_length_beet': instance.miniLengthBeet,
      'max_length_beet': instance.maxLengthBeet,
      'total_relivers': instance.totalRelivers,
    };
