// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emp_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeListResponse _$EmployeeListResponseFromJson(
        Map<String, dynamic> json) =>
    EmployeeListResponse(
      status: json['status'] as bool,
      message: json['message'] as String,
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeListResponseToJson(
        EmployeeListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      employeeList: (json['employee_list'] as List<dynamic>)
          .map((e) => Employee.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'employee_list': instance.employeeList,
    };

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      id: (json['id'] as num).toInt(),
      employeeId: json['employee_id'] as String,
      employeeName: json['employee_name'] as String,
      fatherName: json['father_name'] as String,
      mobileNo: (json['mobile_no'] as num).toInt(),
      aadharNo: (json['aadhar_no'] as num).toInt(),
      employeeType: json['employee_type'] as String,
      gender: json['gender'] as String,
      weekOffDay: json['week_off_day'] as String,
      totalAssignedBeets: (json['total_assigned_beets'] as num).toInt(),
      employeePhoto: json['employee_photo'] as String,
      employeeRating: (json['employee_rating'] as num).toDouble(),
      totalDistance: (json['total_distance'] as num).toInt(),
      mainBeetName: json['main_beet_name'] as String,
      minDistance: (json['min_distance'] as num).toInt(),
      maxDistance: (json['max_distance'] as num).toInt(),
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'employee_id': instance.employeeId,
      'employee_name': instance.employeeName,
      'father_name': instance.fatherName,
      'mobile_no': instance.mobileNo,
      'aadhar_no': instance.aadharNo,
      'employee_type': instance.employeeType,
      'gender': instance.gender,
      'week_off_day': instance.weekOffDay,
      'total_assigned_beets': instance.totalAssignedBeets,
      'employee_photo': instance.employeePhoto,
      'employee_rating': instance.employeeRating,
      'total_distance': instance.totalDistance,
      'main_beet_name': instance.mainBeetName,
      'min_distance': instance.minDistance,
      'max_distance': instance.maxDistance,
    };
