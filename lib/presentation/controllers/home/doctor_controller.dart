import 'package:doctor_appointment/core/network/api_client.dart';
import 'package:doctor_appointment/data/models/doctor_response_model.dart';
import 'package:doctor_appointment/data/repository/doctor_repository.dart';
import 'package:doctor_appointment/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class DoctorController extends GetxController {
  RxList doctors = [].obs;
  RxBool isLoading = false.obs;
  RxString error = "".obs;

  @override
  void onInit() {
    fetchDoctorsData();
    super.onInit();
  }

  void fetchDoctorsData() async {
    try {
      error.value = "";
      isLoading.value = true;
      doctors.value = await DoctorRepository().getDoctorsData();
    } on ApiException catch (e) {
      error.value = e.toString();
      Utils.showSnackBar(title: "API Failure", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void navigateToDetail(DoctorResponseModel data) {
    Get.toNamed(Routes.doctorDetail, arguments: data);
  }
}
