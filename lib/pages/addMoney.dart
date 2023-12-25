import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gashapon_application/bloc/bloc/add_money_bloc.dart';
import 'package:gashapon_application/bloc/bloc/add_money_event.dart';
import 'package:gashapon_application/bloc/bloc/add_money_state.dart';

import 'package:gashapon_application/bloc/tier_item/tier_item_bloc.dart';
import 'package:gashapon_application/pages/randomItem.dart';
import 'package:quickalert/quickalert.dart';

class AddMoney extends StatelessWidget {
  const AddMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('ฝากเงิน'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider(
          create: (context) => DepositBloc(),
          child: AddMoneyForm(),
        ),
      ),
    );
  }
}

class AddMoneyForm extends StatefulWidget {
  @override
  _AddMoneyFormState createState() => _AddMoneyFormState();
}

class _AddMoneyFormState extends State<AddMoneyForm> {
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: amountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            prefixIcon: Icon(Icons.money),
            labelText: 'จำนวนเงิน',
            hintText: 'บาท',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            final amount = double.tryParse(amountController.text);
            if (amount != null) {
              context.read<DepositBloc>().add(Deposit(amount: amount));
              QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  showCancelBtn: false,
                  confirmBtnText: "ยืนยัน",
                  title: "สำเร็จ!",
                  text: "ฝากเงินจำนวน $amount บาทเรียบร้อยแล้ว");
            } else {
              QuickAlert.show(
                  context: context,
                  type: QuickAlertType.error,
                  showCancelBtn: false,
                  confirmBtnText: "ยืนยัน",
                  title: "เกิดข้อผิดพลาด",
                  text: "โปรดพิมพ์จำนวนเงินให้ถูกต้องและต้องไม่เป็นค่าว่าง");
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'ยืนยัน',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 0, 0, 0),
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              if (amountController.text == '') {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    showCancelBtn: false,
                    confirmBtnText: "ยืนยัน",
                    title: "เกิดข้อผิดพลาด",
                    text: "โปรดพิมพ์จำนวนเงินให้ถูกต้องและต้องไม่เป็นค่าว่าง");
              } else {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => TierItemBloc(
                          money: double.parse(amountController.text)),
                      child: MyHomePage(),
                    );
                  },
                ));
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "หน้าสุ่มไอเท็ม",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            )),
        SizedBox(
          height: 24,
        ),
        BlocBuilder<DepositBloc, DepositState>(
          builder: (context, state) {
            if (state is DepositSuccess) {
              return Text(
                'ฝากเงินสำเร็จจำนวน ${state.amount} บาท',
                style: TextStyle(fontSize: 16),
              );
            } else if (state is DepositFailure) {
              return Text('เกิดปัญหาระหว่างฝากเงิน: ${state.message}');
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
