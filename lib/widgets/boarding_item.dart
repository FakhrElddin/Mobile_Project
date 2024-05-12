import 'package:flutter/material.dart';
import 'package:mobile_project/models/boarding_model.dart';
import 'package:lottie/lottie.dart';



class BoardingItem extends StatelessWidget {
  const BoardingItem({super.key, required this.boardingModel});

  final BoardingModel boardingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Center(child: Lottie.asset(boardingModel.image)),
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          boardingModel.title,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          boardingModel.body,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
