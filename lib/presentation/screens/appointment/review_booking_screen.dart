import 'package:doctor_appointment/data/models/navigation_helper.dart';
import 'package:doctor_appointment/presentation/controllers/appointment/review_booking_controller.dart';
import 'package:doctor_appointment/presentation/widgets/button_widget.dart';
import 'package:doctor_appointment/presentation/widgets/doctor_widget.dart';
import 'package:doctor_appointment/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReviewBookingScreen extends StatelessWidget {
  ReviewBookingScreen({Key? key}) : super(key: key);

  final _controller = Get.put(ReviewBookingController());
  final DoctorAndPackageData data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.appBar(title: "Review Summary"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: [
            DoctorHeaderWidget(data: data.selectedDoctor),
            const SizedBox(
              height: 20.0,
            ),
            const Divider(
              thickness: 0.1,
            ),
            const SizedBox(
              height: 20.0,
            ),
            RowWidget(
                label: "Date & Hour",
                value:
                    "${DateFormat.MMMM().format(DateTime.parse(data.selectedDate))} ${DateTime.parse(data.selectedDate).day}, ${DateTime.parse(data.selectedDate).year} | ${data.selectedTime}"),
            const SizedBox(height: 20.0),
            RowWidget(label: "Package", value: data.selectedPackage),
            const SizedBox(height: 20.0),
            RowWidget(label: "Duration", value: data.selectedDuration),
            const SizedBox(height: 20.0),
            const RowWidget(label: "Booking for", value: "Self"),
            const SizedBox(height: 20.0),
            Expanded(
                child: ButtonWidget.elevatedButton(
                    context: context,
                    onPress: () => _controller.confirmBooking(data),
                    child: const Text("Confirm"),
                    alignment: Alignment.bottomCenter))
          ],
        ),
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    super.key,
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.black54),
        ),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
        )
      ],
    );
  }
}
