import 'package:doctor_appointment/data/models/doctor_response_model.dart';
import 'package:doctor_appointment/presentation/widgets/button_widget.dart';
import 'package:doctor_appointment/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/doctor_details_controller.dart';
import '../themes/app_colors.dart';
import '../widgets/doctor_widget.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({Key? key}) : super(key: key);

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  final _controller = Get.put(DoctorDetailsController());
  final DoctorResponseModel data = Get.arguments;

  @override
  void initState() {
    // As the data already fetched in previous screens, initialising & processing available slot & time
    _controller.availability =
        _controller.processAvailabilityList(data.availability!);
    _controller.availableTimes.value = _controller.availability[0]['times'];
    _controller.selectedDate = _controller.availability[0]['date'];
    _controller.selectedTime = _controller.availableTimes[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.appBar(title: "Book Appointment"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoctorHeaderWidget(data: data),
            const SizedBox(
              height: 20.0,
            ),
            const Divider(
              thickness: 0.1,
            ),
            const SizedBox(
              height: 20.0,
            ),
            MetaDataRow(data: data),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              "BOOK APPOINTMENT",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Day",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 15.0,
            ),
            DayPicker(controller: _controller),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Time",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 15.0,
            ),
            TimePicker(controller: _controller),
            Expanded(
              child: ButtonWidget.elevatedButton(
                  alignment: Alignment.bottomCenter,
                  context: context,
                  onPress: () => _controller.makeAppointment(data),
                  child: const Text("Make Appointment")),
            )
          ],
        ),
      ),
    );
  }
}

class TimePicker extends StatelessWidget {
  const TimePicker({
    super.key,
    required DoctorDetailsController controller,
  }) : _controller = controller;

  final DoctorDetailsController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Obx(() => GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1 / 1.5),
            itemCount: _controller.availableTimes.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Obx(() => GestureDetector(
                        onTap: () {
                          _controller.selectedTimeIndex.value = index;
                          _controller.selectedTime =
                              _controller.availableTimes[index];
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    _controller.selectedTimeIndex.value == index
                                        ? AppColors.blue
                                        : Colors.grey),
                            color: _controller.selectedTimeIndex.value == index
                                ? AppColors.blue
                                : AppColors.white,
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(50.0),
                                right: Radius.circular(50.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _controller.availableTimes[index],
                                style: TextStyle(
                                    color:
                                        _controller.selectedTimeIndex.value ==
                                                index
                                            ? AppColors.white
                                            : AppColors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              );
            },
          )),
    );
  }
}

class DayPicker extends StatelessWidget {
  const DayPicker({
    super.key,
    required DoctorDetailsController controller,
  }) : _controller = controller;

  final DoctorDetailsController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, mainAxisSpacing: 2.0, childAspectRatio: 1 / 1.5),
        itemCount: _controller.availability.length,
        itemBuilder: (context, index) {
          final availabilityData = _controller.availability[index];
          final day = availabilityData['day'];
          final dayOfWeek = availabilityData['dayOfWeek'];
          final month = availabilityData['month'];
          return Column(
            children: [
              Obx(() => GestureDetector(
                    onTap: () {
                      _controller.selectedDateIndex.value = index;
                      _controller.availableTimes.value =
                          _controller.availability[index]['times'];
                      _controller.selectedTimeIndex.value = 0;
                      _controller.selectedDate =
                          _controller.availability[index]['date'];
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: index == _controller.selectedDateIndex.value
                                ? AppColors.blue
                                : Colors.grey),
                        color: index == _controller.selectedDateIndex.value
                            ? AppColors.blue
                            : AppColors.white,
                        borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(50.0),
                            right: Radius.circular(50.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dayOfWeek,
                            style: TextStyle(
                                color:
                                    index == _controller.selectedDateIndex.value
                                        ? AppColors.white
                                        : AppColors.black),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "$day $month",
                            style: TextStyle(
                                color:
                                    index == _controller.selectedDateIndex.value
                                        ? AppColors.white
                                        : AppColors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }
}

class MetaDataRow extends StatelessWidget {
  const MetaDataRow({
    super.key,
    required this.data,
  });

  final DoctorResponseModel data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DoctorMetaDataWidget(
          data: "${data.patientsServed}+",
          icon: CupertinoIcons.person_2_alt,
          label: "Patients",
        ),
        DoctorMetaDataWidget(
          data: "${data.yearsOfExperience}+",
          icon: CupertinoIcons.briefcase_fill,
          label: "Years Exp.",
        ),
        DoctorMetaDataWidget(
          data: "${data.rating}+",
          icon: CupertinoIcons.star_slash_fill,
          label: "Rating",
        ),
        DoctorMetaDataWidget(
          data: "${data.numberOfReviews}",
          icon: Icons.chat,
          label: "Review",
        )
      ],
    );
  }
}

class DoctorMetaDataWidget extends StatelessWidget {
  const DoctorMetaDataWidget({
    super.key,
    required this.data,
    required this.icon,
    required this.label,
  });

  final String data;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.lightBlue,
          child: Icon(
            icon,
            color: AppColors.blue,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          data,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: AppColors.blue),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}
