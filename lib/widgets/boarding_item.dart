import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_project/models/boarding_model.dart';


class BoardingItem extends StatelessWidget {
  const BoardingItem({super.key, required this.boardingModel});

  final BoardingModel boardingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Center(child: SvgPicture.asset(boardingModel.image,)),
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
