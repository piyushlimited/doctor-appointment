import 'package:doctor_appointment/presentation/controllers/home_controller.dart';
import 'package:doctor_appointment/presentation/screens/home/doctor_screen.dart';
import 'package:doctor_appointment/presentation/screens/home/my_appointments_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: _controller.currentIndex.value,
          children: [DoctorScreen(), MyAppointmentsScreen()],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: _controller.currentIndex.value,
          elevation: 10.0,
          onTap: _controller.changePage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.medical_services),
              label: 'Doctors',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'My Appointments',
            ),
          ],
        ),
      ),
    );
  }
}
