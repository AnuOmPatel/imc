import 'package:get/get.dart';
import 'package:imc_track/routes/routes.dart';
import 'package:imc_track/screens/assignedbeats/binding/assigned_beat_binding.dart';
import 'package:imc_track/screens/assignedbeats/view/assigned_beat_screen.dart';
import 'package:imc_track/screens/createdbeatsscreen/binding/created_beat_binding.dart';
import 'package:imc_track/screens/createdbeatsscreen/views/created_beats_screen.dart';
import 'package:imc_track/screens/employeescreen/bindings/employee_bindings.dart';
import 'package:imc_track/screens/employeescreen/views/employee_screen.dart';
import 'package:imc_track/screens/homescreen/bindings/HomeBindings.dart';
import 'package:imc_track/screens/homescreen/view/Homescreen.dart';
import 'package:imc_track/screens/loginscreen/bindings/LoginBindings.dart';
import 'package:imc_track/screens/loginscreen/view/LoginScreen.dart';
import 'package:imc_track/screens/mapviewunassigned/binding/unassigned_map_binding.dart';
import 'package:imc_track/screens/mapviewunassigned/view/unassigned_map_screen.dart';
import 'package:imc_track/screens/nearestbeatscreen/binding/nearest_beat_binding.dart';
import 'package:imc_track/screens/nearestbeatscreen/view/nearest_beat_screen.dart';
import 'package:imc_track/screens/profilescreen/bindings/profile_bindings.dart';
import 'package:imc_track/screens/profilescreen/view/profile_screen.dart';
import 'package:imc_track/screens/splashscreen/binding/SplashBinding.dart';
import 'package:imc_track/screens/splashscreen/view/splash_screen.dart';
import 'package:imc_track/screens/viewbeatbyemp/views/view_beat_by_emp_screen.dart';
import 'package:imc_track/screens/wardwisebeats/binding/ward_beat_bindings.dart';
import 'package:imc_track/screens/wardwisebeats/view/ward_beat_screen.dart';

import '../screens/unassignedbeats/binding/unassigned_beat_binding.dart';
import '../screens/unassignedbeats/view/unassigned_beat_screen.dart';
import '../screens/viewbeatbyemp/bindings/view_beat_by_emp_binding.dart';

class AppPages {
  static const initialRoute = Routes.splashScreen;
  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => Homescreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: Routes.profileScreen,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.nearestBeatScreen,
      page: () => NearestBeatScreen(),
      binding: NearestBeatBinding(),
    ),
    GetPage(
      name: Routes.viewBeatByEmpScreen,
      page: () => ViewBeatByEmpScreen(),
      binding: viewBeatByEmpBinding(),
    ),
    GetPage(
      name: Routes.employeeScreen,
      page: () => EmployeesScreen(),
      binding: EmployeesBindings(),
    ),
    GetPage(
      name: Routes.createdBeatScreen,
      page: () => CreatedBeatScreen(),
      binding: CreatedBeatBindings(),
    ),
    GetPage(
      name: Routes.wardBeatScreen,
      page: () => WardWiseBeatScreen(),
      binding: WardWiseBeatBinding(),
    ),
    GetPage(
      name: Routes.assignedBeatScreen,
      page: () => AssignedBeatScreen(),
      binding: AssignedBeatBinding(),
    ),
    GetPage(
      name: Routes.unassignedBeatScreen,
      page: () => UnAssignedBeatScreen(),
      binding: UnAssignedBeatBinding(),
    ),
    GetPage(
      name: Routes.unassignedBeatMapScreen,
      page: () => UnAssignedBeatMapScreen(),
      binding: UnAssignedBeatMapBinding(),
    ),
  ];

}
