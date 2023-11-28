import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gashapon_application/bloc/tier_item/deposit/bloc/add_money_bloc.dart';
import 'package:gashapon_application/bloc/tier_item/deposit/bloc/add_money_event.dart';
import 'package:gashapon_application/bloc/tier_item/deposit/bloc/add_money_state.dart';
import 'package:gashapon_application/bloc/tier_item/tier_item_bloc.dart';
import 'package:gashapon_application/pages/randomItem.dart';

class AddMoney extends StatelessWidget {
  const AddMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposit Money'),
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
          decoration: const InputDecoration(
            labelText: 'Amount',
            hintText: 'Enter amount',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            final amount = double.tryParse(amountController.text);
            if (amount != null) {
              context.read<DepositBloc>().add(Deposit(amount: amount));
            }
          },
          child: const Text('Submit'),
        ),
        BlocBuilder<DepositBloc, DepositState>(
          builder: (context, state) {
            if (state is DepositSuccess) {
              return Text('Successfully deposited \$${state.amount}');
            } else if (state is DepositFailure) {
              return Text('Failed to deposit: ${state.message}');
            }
            return const SizedBox.shrink();
          },
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                 return BlocProvider(
                    create: (context) => TierItemBloc(),
                    child: MyHomePage(),
                  );
                },
              ));
            },
            child: Text("ไปหน้าสุ่มไอเท็ม"))
      ],
    );
  }
}
