import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gashapon_application/bloc/tier_item/deposit/bloc/add_money_event.dart';
import 'package:gashapon_application/bloc/tier_item/deposit/bloc/add_money_state.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';


class DepositBloc extends Bloc<DepositEvent, DepositState> {
 DepositBloc() : super(DepositInitial());

 @override
 Stream<DepositState> mapEventToState(DepositEvent event) async* {
    if (event is Deposit) {
      if (event.amount > 0) {
        yield DepositSuccess(amount: event.amount);
      } else {
        yield DepositFailure(message: 'Amount must be greater than 0');
      }
    }
 }
}