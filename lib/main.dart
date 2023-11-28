import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gashapon_application/pages/randomItem.dart';
import 'package:gashapon_application/widgets/display_item.dart';
import 'package:gashapon_application/widgets/generate_button.dart';

import 'bloc/tier_item_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => TierItemBloc(),
        child: MyHomePage(),
      ),
    );
  }
}


