import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('โปรแกรมสุ่มไอเท็ม')),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<TierItemBloc, TierItemState>(
              builder: (context, state) {
                if (state is TierItemInitial) {
                  return const Text('Press the button to generate a tier item.');
                } else if (state is SPlusTierItem) {
                  return const Text('S+ Tier Item');
                } else if (state is STierItem) {
                  return const Text('S Tier Item');
                } else if (state is ATierItem) {
                  return const Text('A Tier Item');
                } else if (state is BTierItem) {
                  return const Text('B Tier Item');
                } else if (state is CTierItem) {
                  return const Text('C Tier Item');
                } else {
                  return const Text('Unknown Tier Item');
                }
              },
            ),
            const SizedBox(height: 20),
            GenerateButton(context),
          ],
        ),
      ),
    );
  }
}
