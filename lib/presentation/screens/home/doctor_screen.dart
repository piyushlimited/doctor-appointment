import 'package:doctor_appointment/data/models/doctor_response_model.dart';
import 'package:doctor_appointment/presentation/controllers/home/doctor_controller.dart';
import 'package:doctor_appointment/presentation/widgets/doctor_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorScreen extends StatelessWidget {
  DoctorScreen({Key? key}) : super(key: key);

  final _controller = Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => _controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : _controller.error.value.isNotEmpty
                ? Center(child: Text(_controller.error.value))
                : _controller.doctors.isEmpty
                    ? const Center(
                        child: Text("No doctors are currently available."))
                    : Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _controller.doctors.length,
                            itemBuilder: (context, index) {
                              DoctorResponseModel data =
                                  _controller.doctors[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: GestureDetector(
                                  onTap: () =>
                                      _controller.navigateToDetail(data),
                                  child: Card(
                                    elevation: 2,
                                    child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: DoctorHeaderWidget(data: data)),
                                  ),
                                ),
                              );
                            }),
                      )),
      ),
    );
  }
}
