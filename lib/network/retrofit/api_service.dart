import 'package:dio/dio.dart';
import 'package:imc_track/network/requests/assigned_beat_request.dart';
import 'package:imc_track/network/requests/created_beat_list.dart';
import 'package:imc_track/network/requests/emp_list_request.dart';
import 'package:imc_track/network/requests/near_by_beat_request.dart';
import 'package:imc_track/network/requests/near_by_employees_with_beat_request.dart';
import 'package:imc_track/network/requests/view_beat_by_emp_request.dart';
import 'package:retrofit/retrofit.dart';

import '../requests/dash_board_data_request.dart';
import '../requests/login_request.dart';
import '../requests/unassigned_beat_request.dart';
import '../requests/ward_master_request.dart';

import '../responses/login_response/login_response.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: 'https://ezismartswitch.com/imc/imc_api/')
abstract class ApiService{
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("api_imc_sql_1.php")
  //Future<LoginResponse> login(@Body() LoginRequest request);
  Future<dynamic> login(@Body() LoginRequest request);

  @POST("api_imc_sql_1.php")
  //Future<LoginResponse> login(@Body() LoginRequest request);
  Future<dynamic> viewWardByZones(@Body() WardMasterRequestByZone wardMasterRequest);

  //{"action":"dashboard_data","zone_id": 4,"ward_id":11,"employee_id":1}
  @POST("api_imc_sql_1.php")
  //Future<LoginResponse> login(@Body() LoginRequest request);
  Future<dynamic> viewDashboardData(@Body() DashBoardDataRequest dashboardDatarequest);

  //{"action":"view_beet_by_lat_lng","coordinates": [[[[75.9275494, 22.7957256]]]]}
  @POST("api_imc_sql_1.php")
  Future<dynamic> getNearestBeats(@Body() NearByBeatRequest nearByBeatsRequest);

  //{"action":"view_employee_with_nearest_beet","coordinates":[[[[75.8668,22.7544]]]]}
  @POST("api_imc_sql_1.php")
  Future<dynamic> getNearestEmpandBeats(@Body() NearByEmployeesWithBeatRequest nearByEmpRequest);

  //{"action":"view_beets_by_employee","employee_id":7945}
  @POST("api_imc_sql_1.php")
  Future<dynamic> getBeatsByEmpliyee(@Body() ViewBeatsByEmpRequest viewBeatByEmpRequest);

  //{"action":"employee_list","zone_id": 1,"ward_id":7}
  @POST("api_imc_sql_1.php")
  Future<dynamic> viewAllEmpWard(@Body() EmployeeListRequest emplistRequest);

  //{"action":"view_beet_master_by_zone_and_ward","zone_id": "17","ward_id":18}
  @POST("api_imc_sql_1.php")
  Future<dynamic> viewCreatedBeats(@Body() CreatedBeatRequest createdBeatRequest);

  //{"action":"view_assigned_beets","zone_id": "17","ward_id":18}
  @POST("api_imc_sql_1.php")
  Future<dynamic> viewAssignedBeats(@Body() AssignedBeatRequest assignedBeatRequest);

  //{"action":"view_unassigned_beets","zone_id": "17","ward_id":18}
  @POST("api_imc_sql_1.php")
  Future<dynamic> viewUnAssignedBeats(@Body() UnAssignedBeatRequest unassignedBeatRequest);
}