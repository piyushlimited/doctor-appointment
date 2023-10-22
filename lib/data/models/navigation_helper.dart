import 'package:doctor_appointment/data/models/doctor_response_model.dart';

class AppointedDoctorData {
  final String selectedDate;
  final String selectedTime;
  final DoctorResponseModel selectedDoctor;

  AppointedDoctorData(
      {required this.selectedDate,
      required this.selectedTime,
      required this.selectedDoctor});
}

class DoctorAndPackageData extends AppointedDoctorData {
  final String selectedDuration;
  final String selectedPackage;
  DoctorAndPackageData({
    required super.selectedDate,
    required super.selectedTime,
    required super.selectedDoctor,
    required this.selectedDuration,
    required this.selectedPackage,
  });
}
