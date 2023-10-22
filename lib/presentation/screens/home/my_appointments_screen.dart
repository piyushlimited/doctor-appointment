import 'package:doctor_appointment/presentation/controllers/home/my_appointments_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/my_booking_widget.dart';

class MyAppointmentsScreen extends StatelessWidget {
  MyAppointmentsScreen({Key? key}) : super(key: key);

  final _controller = Get.put(MyAppointmentsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : _controller.error.value.isNotEmpty
              ? Center(child: Text(_controller.error.value))
              : _controller.bookingsData.isEmpty
                  ? const Center(child: Text("No appointment scheduled."))
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          const Divider(
                            thickness: 0.1,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _controller.bookingsData.length,
                            itemBuilder: (context, index) {
                              return MyBookingCardWidget(
                                bookingData: _controller.bookingsData[index],
                              );
                            },
                          ),
                        ],
                      ),
                    )),
    );
  }
}
