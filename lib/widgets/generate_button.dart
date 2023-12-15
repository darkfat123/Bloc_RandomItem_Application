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
      onPressed: () {
        // Dispatch an event to generate a new item and deduct money
        BlocProvider.of<TierItemBloc>(context).add(GenerateRandomNumber(cost: 20));
      },
      child: Text('Generate Item'),
    );
  }
}

