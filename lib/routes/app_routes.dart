import 'package:doctor_appointment/presentation/screens/appointment/booking_confirmation_screen.dart';
import 'package:doctor_appointment/presentation/screens/appointment/review_booking_screen.dart';
import 'package:doctor_appointment/presentation/screens/appointment/select_package_screen.dart';
import 'package:doctor_appointment/presentation/screens/appointment/view_bookings_screen.dart';
import 'package:doctor_appointment/presentation/screens/doctor_details_screen.dart';
import 'package:doctor_appointment/presentation/screens/home_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const home = "/home";
  static const doctorDetail = "/doctorDetail";
  static const selectPackage = "/selectPackage";
  static const reviewBooking = "/reviewBooking";
  static const bookingConfirmation = "/bookingConfirmation";
  static const viewBookings = "/viewBookings";
}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 0),
    ),
    GetPage(
      name: Routes.doctorDetail,
      page: () => const DoctorDetailsScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 0),
    ),
    GetPage(
      name: Routes.selectPackage,
      page: () => SelectPackageScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 0),
    ),
    GetPage(
      name: Routes.reviewBooking,
      page: () => ReviewBookingScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 0),
    ),
    GetPage(
      name: Routes.bookingConfirmation,
      page: () => BookingConfirmationScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 0),
    ),
    GetPage(
      name: Routes.viewBookings,
      page: () => ViewBookingsScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 0),
    ),
  ];
}
