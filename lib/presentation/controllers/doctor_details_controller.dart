import 'package:doctor_appointment/data/models/doctor_response_model.dart';
import 'package:doctor_appointment/data/models/navigation_helper.dart';
import 'package:doctor_appointment/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DoctorDetailsController extends GetxController {
  late List<Map<String, dynamic>> availability;
  RxList availableTimes = [].obs;
  late String selectedDate;
  late String selectedTime;
  RxInt selectedTimeIndex = 0.obs;
  RxInt selectedDateIndex = 0.obs;

  void makeAppointment(DoctorResponseModel selectedDoctor) {
    Get.toNamed(Routes.selectPackage,
        arguments: AppointedDoctorData(
            selectedDate: selectedDate,
            selectedTime: selectedTime,
            selectedDoctor: selectedDoctor));
  }

  List<Map<String, dynamic>> processAvailabilityList(
      Map<String, List<String>> availability) {
    List<Map<String, dynamic>> processedList = [];

    availability.forEach((date, times) {
      if (times.isNotEmpty) {
        DateTime dateTime = DateTime.parse(date);
        String month = DateFormat.MMM().format(dateTime);
        String dayOfWeek = DateFormat.E().format(dateTime);

        List<String> processedTimes = [];
        for (String timeRange in times) {
          List<String> splitTimes = splitTimeRange(timeRange);
          processedTimes.addAll(splitTimes);
        }

        Map<String, dynamic> processedItem = {
          'date': date,
          'day': dateTime.day.toString(),
          'times': processedTimes,
          'month':
              DateTime.now().difference(dateTime).inDays == 0 ? "Today" : month,
          'dayOfWeek': dayOfWeek,
        };

        processedList.add(processedItem);
      }
    });

    return processedList;
  }

  List<String> splitTimeRange(String timeRange) {
    List<String> splitTimes = [];
    final RegExp timeRegExp =
        RegExp(r'(\d+:\d+\s[APMapm]+)\s-\s(\d+:\d+\s[APMapm]+)');
    final match = timeRegExp.firstMatch(timeRange);
    if (match != null) {
      final startTime = match.group(1);
      final endTime = match.group(2);
      // Replace non-breaking space with regular space
      final cleanStartTime = startTime!.replaceAll('\u2009', ' ');
      final cleanEndTime = endTime!.replaceAll('\u2009', ' ');

      List<String> startComponents = _extractTimeComponents(cleanStartTime);
      List<String> endComponents = _extractTimeComponents(cleanEndTime);

      DateTime startDateTime = DateTime(2023, 1, 1,
          int.parse(startComponents[0]), int.parse(startComponents[1]));
      DateTime endDateTime = DateTime(
          2023, 1, 1, int.parse(endComponents[0]), int.parse(endComponents[1]));

      while (startDateTime.isBefore(endDateTime)) {
        splitTimes.add(DateFormat.jm().format(startDateTime));
        startDateTime = startDateTime.add(Duration(minutes: 30));
      }
    }
    return splitTimes;
  }

  List<String> _extractTimeComponents(String time) {
    final parts = time.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1].split(' ')[0]);
    final isPM = parts[1].contains('PM');

    // Convert hour to 12-hour format
    int hour12 = isPM ? (hour == 12 ? 12 : hour + 12) : (hour == 12 ? 0 : hour);

    return [hour12.toString(), minute.toString()];
  }
}
