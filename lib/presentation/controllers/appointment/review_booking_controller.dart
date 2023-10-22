import 'package:doctor_appointment/data/models/navigation_helper.dart';
import 'package:doctor_appointment/routes/app_routes.dart';
import 'package:get/get.dart';

class ReviewBookingController extends GetxController {
  void confirmBooking(DoctorAndPackageData data) {
    // Keeping data for future use as current flow doesn't makes much sense.
    Get.toNamed(Routes.bookingConfirmation);
  }
}
