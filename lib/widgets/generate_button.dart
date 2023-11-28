import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gashapon_application/bloc/tier_item_bloc.dart';

// ignore: non_constant_identifier_names
Widget GenerateButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      BlocProvider.of<TierItemBloc>(context).add(GenerateRandomNumber());
    },
    style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.all(20)),backgroundColor: MaterialStateProperty.all(Colors.black)),
    child: Text('สุ่มไอเทม'),
  );
}
