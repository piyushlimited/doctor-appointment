import 'package:doctor_appointment/data/models/appointment_response_model.dart';
import 'package:doctor_appointment/data/models/navigation_helper.dart';
import 'package:doctor_appointment/data/repository/appointment_repository.dart';
import 'package:doctor_appointment/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../../core/network/api_client.dart';
import '../../../utils/utils.dart';

class SelectPackageController extends GetxController {
  late AppointmentOptionsResponse packageData;
  RxBool isLoading = false.obs;
  RxString error = "".obs;
  RxString selectedDuration = "".obs;
  RxString selectedPackage = "".obs;

  @override
  void onInit() {
    fetchPackageData();
    super.onInit();
  }

  void fetchPackageData() async {
    try {
      error.value = "";
      isLoading.value = true;
      packageData = await AppointmentRepository().getAppointmentOptionData();
      if (packageData.duration!.isNotEmpty) {
        selectedDuration.value = packageData.duration!.first;
      }
      if (packageData.duration!.isNotEmpty) {
        selectedPackage.value = packageData.package!.first;
      }
    } on ApiException catch (e) {
      error.value = e.toString();
      Utils.showSnackBar(title: "API Failure", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void nextButtonClick(AppointedDoctorData appointedDoctorData) {
    Get.toNamed(Routes.reviewBooking,
        arguments: DoctorAndPackageData(
            selectedDate: appointedDoctorData.selectedDate,
            selectedTime: appointedDoctorData.selectedTime,
            selectedDoctor: appointedDoctorData.selectedDoctor,
            selectedDuration: selectedDuration.value,
            selectedPackage: selectedPackage.value));
  }
}
