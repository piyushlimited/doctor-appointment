import 'dart:convert';

class AppointmentOptionsResponse {
  List<String>? duration;
  List<String>? package;

  AppointmentOptionsResponse({
    this.duration,
    this.package,
  });

  factory AppointmentOptionsResponse.fromJson(Map<String, dynamic> json) =>
      AppointmentOptionsResponse(
        duration: json["duration"] == null
            ? []
            : List<String>.from(json["duration"]!.map((x) => x)),
        package: json["package"] == null
            ? []
            : List<String>.from(json["package"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "duration":
            duration == null ? [] : List<dynamic>.from(duration!.map((x) => x)),
        "package":
            package == null ? [] : List<dynamic>.from(package!.map((x) => x)),
      };
}

// Appointment Confirmation

class AppointmentConfirmationResponse {
  String? doctorName;
  DateTime? appointmentDate;
  String? appointmentTime;
  String? location;
  String? appointmentPackage;

  AppointmentConfirmationResponse({
    this.doctorName,
    this.appointmentDate,
    this.appointmentTime,
    this.location,
    this.appointmentPackage,
  });

  factory AppointmentConfirmationResponse.fromJson(Map<String, dynamic> json) =>
      AppointmentConfirmationResponse(
        doctorName: json["doctor_name"],
        appointmentDate: json["appointment_date"] == null
            ? null
            : DateTime.parse(json["appointment_date"]),
        appointmentTime: json["appointment_time"],
        location: json["location"],
        appointmentPackage: json["appointment_package"],
      );

  Map<String, dynamic> toJson() => {
        "doctor_name": doctorName,
        "appointment_date":
            "${appointmentDate!.year.toString().padLeft(4, '0')}-${appointmentDate!.month.toString().padLeft(2, '0')}-${appointmentDate!.day.toString().padLeft(2, '0')}",
        "appointment_time": appointmentTime,
        "location": location,
        "appointment_package": appointmentPackage,
      };
}

// All Appointments

List<AppointmentResponse> appointmentResponseFromJson(dynamic response) =>
    List<AppointmentResponse>.from(
        response.map((x) => AppointmentResponse.fromJson(x)));

String appointmentResponseToJson(List<AppointmentResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppointmentResponse {
  String? bookingId;
  String? doctorName;
  String? location;
  DateTime? appointmentDate;
  String? appointmentTime;

  AppointmentResponse({
    this.bookingId,
    this.doctorName,
    this.location,
    this.appointmentDate,
    this.appointmentTime,
  });

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) =>
      AppointmentResponse(
        bookingId: json["booking_id"],
        doctorName: json["doctor_name"],
        location: json["location"],
        appointmentDate: json["appointment_date"] == null
            ? null
            : DateTime.parse(json["appointment_date"]),
        appointmentTime: json["appointment_time"],
      );

  Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "doctor_name": doctorName,
        "location": location,
        "appointment_date":
            "${appointmentDate!.year.toString().padLeft(4, '0')}-${appointmentDate!.month.toString().padLeft(2, '0')}-${appointmentDate!.day.toString().padLeft(2, '0')}",
        "appointment_time": appointmentTime,
      };
}
