import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gashapon_application/bloc/deposit/add_money_bloc.dart';
import 'package:gashapon_application/bloc/tier_item/tier_item_bloc.dart';
import 'package:gashapon_application/pages/addMoney.dart';
import 'package:gashapon_application/pages/randomItem.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => DepositBloc(),
        child: AddMoney(),
      ),
    );
  }
}


