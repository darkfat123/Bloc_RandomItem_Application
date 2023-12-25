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
        title: Text('โปรแกรมสุ่มไอเท็ม'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  BlocBuilder<TierItemBloc, TierItemState>(
                    builder: (context, state) {
                      if (state is MoneyUpdate) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('จำนวนเงินคงเหลือ: ${state.money.toString()}',style: TextStyle(fontSize: 18),),
                          ],
                        );
                      } else {
                        return Text("กดปุ่มเพื่อเริ่มสุ่มไอเทม",style: TextStyle(fontSize: 18),);
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<TierItemBloc, TierItemState>(
                    builder: (context, state) {
                      if (state is MoneyUpdate) {
                        return Text("กดปุ่มเพื่อเริ่มสุ่มไอเท็ม",style: TextStyle(fontSize: 18),);
                      } else if (state is SPlusTierItem) {
                        return DisplayItem("S+ Tier Item");
                      } else if (state is STierItem) {
                        return DisplayItem("S Tier Item");
                      } else if (state is ATierItem) {
                        return DisplayItem("A Tier Item");
                      } else if (state is BTierItem) {
                        return DisplayItem("B Tier Item");
                      } else if (state is CTierItem) {
                        return DisplayItem("C Tier Item");
                      } else {
                        print(state);
                        return Text("เงินของคุณไม่เพียงพอ",style: TextStyle(fontSize: 18),);
                      }
                    },
                  ),
                ],
                
              ),
              SizedBox(
                    height: 20,
                  ),
              GenerateButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
