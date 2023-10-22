import 'package:doctor_appointment/data/models/appointment_response_model.dart';

import '../../core/network/api_client.dart';
import '../app_constant.dart';

class AppointmentRepository {
  Future<List<AppointmentResponse>> getAppointmentsData() async {
    try {
      final response = await ApiClient().getRequest(appointmentsUrl);
      return appointmentResponseFromJson(response.data);
    } on ApiException catch (e) {
      throw ApiException(e.statusCode, e.message);
    }
  }

  Future<AppointmentOptionsResponse> getAppointmentOptionData() async {
    try {
      final response = await ApiClient().getRequest(appointmentOptionsUrl);
      return AppointmentOptionsResponse.fromJson(response.data);
    } on ApiException catch (e) {
      throw ApiException(e.statusCode, e.message);
    }
  }

  Future<AppointmentConfirmationResponse>
      getAppointmentConfirmationData() async {
    try {
      final response = await ApiClient().getRequest(appointmentConfirmationUrl);
      return AppointmentConfirmationResponse.fromJson(response.data);
    } on ApiException catch (e) {
      throw ApiException(e.statusCode, e.message);
    }
  }
}
