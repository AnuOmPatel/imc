import 'package:get/get.dart';
import 'package:imc_track/routes/routes.dart';
import 'package:imc_track/screens/homescreen/bindings/HomeBindings.dart';
import 'package:imc_track/screens/homescreen/view/Homescreen.dart';
import 'package:imc_track/screens/splashscreen/binding/SplashBinding.dart';
import 'package:imc_track/screens/splashscreen/view/splash_screen.dart';


class AppPages {
  static const initialRoute = Routes.splashScreen;
  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
      binding: SplashBindings(),
    ),
    GetPage(
        name: Routes.homeScreen,
        page: () => Homescreen(),
        binding: HomeScreenBinding()),
  ];
}
