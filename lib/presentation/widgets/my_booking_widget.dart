import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/appointment_response_model.dart';
import '../themes/app_colors.dart';
import 'button_widget.dart';

class MyBookingCardWidget extends StatelessWidget {
  const MyBookingCardWidget({
    super.key,
    required this.bookingData,
  });

  final AppointmentResponse bookingData;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${bookingData.appointmentDate!.day} ${DateFormat.MMM().format(bookingData.appointmentDate!)}, ${bookingData.appointmentDate!.year} - ${bookingData.appointmentTime!.split(" -").first}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Divider(
                thickness: 0.1,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Icon(
                      Icons.person,
                      size: 60.0,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 14.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bookingData.doctorName!,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            const Icon(
                              CupertinoIcons.location_solid,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(bookingData.location!)
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.label,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            const Text("Booking ID: "),
                            Text(
                              bookingData.bookingId!,
                              style: const TextStyle(
                                  color: AppColors.blue,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Divider(
                thickness: 0.1,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(
                      child: ButtonWidget.elevatedButton(
                          context: context,
                          onPress: () {},
                          child: const Text(
                            "Cancel",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: AppColors.lightBlue,
                          foregroundColor: AppColors.blue)),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: ButtonWidget.elevatedButton(
                          context: context,
                          onPress: () {},
                          child: const Text("Reschedule")))
                ],
              )
            ],
          ),
        ));
  }
}
