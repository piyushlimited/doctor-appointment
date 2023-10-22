import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/doctor_response_model.dart';
import '../themes/app_colors.dart';

class DoctorHeaderWidget extends StatelessWidget {
  const DoctorHeaderWidget({
    super.key,
    required this.data,
  });

  final DoctorResponseModel data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(data.image!),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: AppColors.blue,
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 14,
              ),
            ),
          ),
        ]),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.doctorName ?? "N/A",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(data.speciality ?? "N/A"),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 20,
                  ),
                  Text(data.location ?? "N/A"),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Icon(
                    CupertinoIcons.map_fill,
                    size: 20,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
