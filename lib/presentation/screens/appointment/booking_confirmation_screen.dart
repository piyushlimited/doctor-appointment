import 'package:doctor_appointment/presentation/controllers/appointment/booking_confirmation_controller.dart';
import 'package:doctor_appointment/presentation/widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/utils.dart';
import '../../themes/app_colors.dart';

class BookingConfirmationScreen extends StatelessWidget {
  BookingConfirmationScreen({Key? key}) : super(key: key);

  final _controller = Get.put(BookingConfirmationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.appBar(title: "Confirmation"),
      body: Obx(() => _controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : _controller.error.value.isNotEmpty
              ? Center(child: Text(_controller.error.value))
              : _controller.appointmentData.doctorName == null
                  ? const Center(child: Text("No appointment found."))
                  : Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Center(
                                  child: CircleAvatar(
                                    radius: 60.0,
                                    backgroundColor: AppColors.blue,
                                    child: Icon(
                                      Icons.check,
                                      size: 60,
                                      weight: 1,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                const Center(
                                  child: Text(
                                    "Appointment Confirmed",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                const Center(
                                  child: Text(
                                    "You have successfully booked appointment with",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Center(
                                  child: Text(
                                    _controller.appointmentData.doctorName!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                const Row(
                                  children: [
                                    Icon(CupertinoIcons.person_alt),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    // Data Missing in Provided API
                                    Text("Esther Howard")
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Row(
                                      children: [
                                        const Icon(Icons.calendar_month),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        // Data Missing in Provided API
                                        Text(
                                          "${_controller.appointmentData.appointmentDate!.day} ${DateFormat.MMM().format(_controller.appointmentData.appointmentDate!)}, ${_controller.appointmentData.appointmentDate!.year}",
                                        )
                                      ],
                                    )),
                                    Expanded(
                                        child: Row(
                                      children: [
                                        const Icon(Icons.timer_rounded),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        // Data Missing in Provided API
                                        Text(_controller
                                            .appointmentData.appointmentTime!
                                            .split(" -")
                                            .first)
                                      ],
                                    ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 0.5,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Column(
                          children: [
                            ButtonWidget.elevatedButton(
                                context: context,
                                onPress: _controller.viewAppointments,
                                child: const Text("View Appointments"),
                                alignment: Alignment.bottomCenter),
                            TextButton(
                                onPressed: _controller.bookAnother,
                                child: const Text(
                                  "Book Another",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blue,
                                      fontSize: 16),
                                ))
                          ],
                        )
                      ],
                    )),
    );
  }
}
