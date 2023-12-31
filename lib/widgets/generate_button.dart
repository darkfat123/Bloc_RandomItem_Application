import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gashapon_application/bloc/tier_item/tier_item_bloc.dart';

// Assuming your GenerateButton widget looks something like this
class GenerateButton extends StatelessWidget {
  final BuildContext context;

  GenerateButton(this.context);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 0, 155, 90),
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        // Dispatch an event to generate a new item and deduct money
        BlocProvider.of<TierItemBloc>(context)
            .add(GenerateRandomNumber(cost: 20));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'สุ่มไอเท็มครั้งละ 20 บาท',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
