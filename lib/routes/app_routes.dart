import 'package:doctor_appointment/presentation/screens/home_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const home = "/home";
}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 0),
    ),
  ];
}
