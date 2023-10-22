import 'dart:convert';

List<DoctorResponseModel> doctorResponseModelFromJson(dynamic response) =>
    List<DoctorResponseModel>.from(
        response.map((x) => DoctorResponseModel.fromJson(x)));

String doctorResponseModelToJson(List<DoctorResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorResponseModel {
  String? doctorName;
  String? image;
  String? speciality;
  String? location;
  int? patientsServed;
  int? yearsOfExperience;
  double? rating;
  int? numberOfReviews;
  Map<String, List<String>>? availability;

  DoctorResponseModel({
    this.doctorName,
    this.image,
    this.speciality,
    this.location,
    this.patientsServed,
    this.yearsOfExperience,
    this.rating,
    this.numberOfReviews,
    this.availability,
  });

  factory DoctorResponseModel.fromJson(Map<String, dynamic> json) =>
      DoctorResponseModel(
        doctorName: json["doctor_name"],
        image: json["image"],
        speciality: json["speciality"],
        location: json["location"],
        patientsServed: json["patients_served"],
        yearsOfExperience: json["years_of_experience"],
        rating: json["rating"]?.toDouble(),
        numberOfReviews: json["number_of_reviews"],
        availability: Map.from(json["availability"]!).map((k, v) =>
            MapEntry<String, List<String>>(
                k, List<String>.from(v.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "doctor_name": doctorName,
        "image": image,
        "speciality": speciality,
        "location": location,
        "patients_served": patientsServed,
        "years_of_experience": yearsOfExperience,
        "rating": rating,
        "number_of_reviews": numberOfReviews,
        "availability": Map.from(availability!).map((k, v) =>
            MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
      };
}
