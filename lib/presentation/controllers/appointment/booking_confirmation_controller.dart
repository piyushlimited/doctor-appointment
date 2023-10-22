import 'package:doctor_appointment/data/models/appointment_response_model.dart';
import 'package:doctor_appointment/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../../core/network/api_client.dart';
import '../../../data/repository/appointment_repository.dart';
import '../../../utils/utils.dart';

class BookingConfirmationController extends GetxController {
  late AppointmentConfirmationResponse appointmentData;
  RxBool isLoading = false.obs;
  RxString error = "".obs;

  @override
  void onInit() {
    fetchPackageData();
    super.onInit();
  }

  void fetchPackageData() async {
    try {
      error.value = "";
      isLoading.value = true;
      appointmentData =
          await AppointmentRepository().getAppointmentConfirmationData();
    } on ApiException catch (e) {
      error.value = e.toString();
      Utils.showSnackBar(title: "API Failure", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void viewAppointments() {
    Get.toNamed(Routes.viewBookings);
  }

  void bookAnother() {
    Get.offAllNamed(Routes.home);
  }
}
