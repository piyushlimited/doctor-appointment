import 'package:doctor_appointment/data/models/navigation_helper.dart';
import 'package:doctor_appointment/presentation/controllers/appointment/select_package_controller.dart';
import 'package:doctor_appointment/presentation/themes/app_colors.dart';
import 'package:doctor_appointment/presentation/widgets/button_widget.dart';
import 'package:doctor_appointment/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectPackageScreen extends StatelessWidget {
  SelectPackageScreen({Key? key}) : super(key: key);

  final _controller = Get.put(SelectPackageController());
  final AppointedDoctorData appointedDoctorData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.appBar(title: "Select Package"),
      body: Obx(() => _controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : _controller.error.value.isNotEmpty
              ? Center(child: Text(_controller.error.value))
              : _controller.packageData.duration!.isEmpty ||
                      _controller.packageData.package!.isEmpty
                  ? const Center(
                      child: Text(
                          "No options are currently available. Please retry after some time."))
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select Duration",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          SelectDurationDropdown(controller: _controller),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "Select Package",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          SelectPackage(controller: _controller),
                          Expanded(
                              child: ButtonWidget.elevatedButton(
                                  context: context,
                                  onPress: () => _controller
                                      .nextButtonClick(appointedDoctorData),
                                  child: const Text("Next"),
                                  alignment: Alignment.bottomCenter))
                        ],
                      ))),
    );
  }
}

class SelectDurationDropdown extends StatelessWidget {
  const SelectDurationDropdown({
    super.key,
    required SelectPackageController controller,
  }) : _controller = controller;

  final SelectPackageController _controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Icon(Icons.access_time_filled),
          ),
          Expanded(
            child: Obx(
              () => DropdownButton<String>(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                underline: const SizedBox(),
                iconEnabledColor: AppColors.blue,
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                ),
                isExpanded: true,
                value: _controller.selectedDuration.value.isEmpty
                    ? null
                    : _controller.selectedDuration.value,
                onChanged: (String? val) {
                  if (val != null) {
                    _controller.selectedDuration.value = val;
                  }
                },
                items: _controller.packageData.duration
                    ?.map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectPackage extends StatelessWidget {
  const SelectPackage({
    super.key,
    required SelectPackageController controller,
  }) : _controller = controller;

  final SelectPackageController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _controller.packageData.package!.map((String item) {
        return Column(
          children: [
            Card(
              child: Obx(() => RadioListTile<String>(
                    value: item,
                    groupValue: _controller.selectedPackage.value.isEmpty
                        ? null
                        : _controller.selectedPackage.value,
                    onChanged: (String? value) {
                      if (value != null) {
                        _controller.selectedPackage.value = value;
                      }
                    },
                    title: Text(
                      item,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("$item with Doctor"),
                    secondary: CircleAvatar(
                      backgroundColor: AppColors.lightBlue,
                      child: Icon(
                          item.toLowerCase().contains("messag")
                              ? Icons.chat
                              : item.toLowerCase().contains("video")
                                  ? Icons.videocam
                                  : item.toLowerCase().contains("voice")
                                      ? Icons.call
                                      : item.toLowerCase().contains("person")
                                          ? Icons.person
                                          : Icons.label_important_outline,
                          color: AppColors.blue),
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                  )),
            ),
            const SizedBox(
              height: 15.0,
            )
          ],
        );
      }).toList(),
    );
  }
}
