import 'package:json_annotation/json_annotation.dart';

part 'emp_list_response.g.dart';

@JsonSerializable()
class EmployeeListResponse {
  bool status;
  String message;
  Result result;

  EmployeeListResponse({
    required this.status,
    required this.message,
    required this.result,
  });

  factory EmployeeListResponse.fromJson(Map<String, dynamic> json) =>
      _$EmployeeListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeListResponseToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: 'employee_list')
  List<Employee> employeeList;

  Result({required this.employeeList});

  factory Result.fromJson(Map<String, dynamic> json) =>
      _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Employee {
  int id;
  @JsonKey(name: 'employee_id')
  String employeeId;
  @JsonKey(name: 'employee_name')
  String employeeName;
  @JsonKey(name: 'father_name')
  String fatherName;
  @JsonKey(name: 'mobile_no')
  int mobileNo;
  @JsonKey(name: 'aadhar_no')
  int aadharNo;
  @JsonKey(name: 'employee_type')
  String employeeType;
  String gender;
  @JsonKey(name: 'week_off_day')
  String weekOffDay;
  @JsonKey(name: 'total_assigned_beets')
  int totalAssignedBeets;
  @JsonKey(name: 'employee_photo')
  String employeePhoto;
  @JsonKey(name: 'employee_rating')
  double employeeRating;
  @JsonKey(name: 'total_distance')
  int totalDistance;
  @JsonKey(name: 'main_beet_name')
  String mainBeetName;
  @JsonKey(name: 'min_distance')
  int minDistance;
  @JsonKey(name: 'max_distance')
  int maxDistance;

  Employee({
    required this.id,
    required this.employeeId,
    required this.employeeName,
    required this.fatherName,
    required this.mobileNo,
    required this.aadharNo,
    required this.employeeType,
    required this.gender,
    required this.weekOffDay,
    required this.totalAssignedBeets,
    required this.employeePhoto,
    required this.employeeRating,
    required this.totalDistance,
    required this.mainBeetName,
    required this.minDistance,
    required this.maxDistance,
  });

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}
