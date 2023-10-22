import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, this.title, this.actions}) : super(key: key);

  final String? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AppBar(
        leading: Get.previousRoute.isNotEmpty
            ? IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ))
            : null,
        title: title != null ? Text(title!) : null,
        actions: actions,
      ),
    );
  }
}
