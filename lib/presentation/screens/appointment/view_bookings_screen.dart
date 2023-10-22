import 'package:doctor_appointment/presentation/controllers/appointment/view_bookings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/utils.dart';
import '../../widgets/my_booking_widget.dart';

class ViewBookingsScreen extends StatelessWidget {
  ViewBookingsScreen({Key? key}) : super(key: key);

  final _controller = Get.put(ViewBookingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.appBar(title: "My Bookings", actions: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(6.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
      ]),
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
