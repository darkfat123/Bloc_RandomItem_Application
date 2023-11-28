import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gashapon_application/bloc/tier_item/tier_item_bloc.dart';
import 'package:gashapon_application/widgets/display_item.dart';
import 'package:gashapon_application/widgets/generate_button.dart';

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
                  return const Text('กดปุ่มเพื่อสุ่มไอเท็ม');
                } else if (state is SPlusTierItem) {
                  return DisplayItem("S+ Tier Item");
                } else if (state is STierItem) {
                  return DisplayItem("S Tier Item");
                } else if (state is ATierItem) {
                  return DisplayItem("A Tier Item");
                } else if (state is BTierItem) {
                  return DisplayItem("B Tier Item");
                } else {
                  return DisplayItem("C Tier Item");
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