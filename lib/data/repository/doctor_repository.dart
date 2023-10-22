import 'package:doctor_appointment/data/app_constant.dart';
import 'package:doctor_appointment/data/models/doctor_response_model.dart';

import '../../core/network/api_client.dart';

class DoctorRepository {
  Future<List<DoctorResponseModel>> getDoctorsData() async {
    try {
      final response = await ApiClient().getRequest(doctorsUrl);
      return doctorResponseModelFromJson(response.data);
    } on ApiException catch (e) {
      throw ApiException(e.statusCode, e.message);
    }
  }
}
