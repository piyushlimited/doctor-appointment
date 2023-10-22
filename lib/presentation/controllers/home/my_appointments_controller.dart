import 'package:get/get.dart';

import '../../../core/network/api_client.dart';
import '../../../data/models/appointment_response_model.dart';
import '../../../data/repository/appointment_repository.dart';
import '../../../utils/utils.dart';

class MyAppointmentsController extends GetxController {
  late List<AppointmentResponse> bookingsData;
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
      bookingsData = await AppointmentRepository().getAppointmentsData();
    } on ApiException catch (e) {
      error.value = e.toString();
      Utils.showSnackBar(title: "API Failure", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
