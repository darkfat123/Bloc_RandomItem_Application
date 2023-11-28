import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        title: Text('Tier Item Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<TierItemBloc, TierItemState>(
              builder: (context, state) {
                if (state is TierItemInitial) {
                  return Text('Press the button to generate a tier item.');
                } else if (state is SPlusTierItem) {
                  return Text('S+ Tier Item');
                } else if (state is STierItem) {
                  return Text('S Tier Item');
                } else if (state is ATierItem) {
                  return Text('A Tier Item');
                } else if (state is BTierItem) {
                  return Text('B Tier Item');
                } else if (state is CTierItem) {
                  return Text('C Tier Item');
                } else {
                  return Text('Unknown Tier Item');
                }
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<TierItemBloc>(context).add(GenerateRandomNumber());
              },
              child: Text('Generate Tier Item'),
            ),
          ],
        ),
      ),
    );
  }
}
