import 'package:equatable/equatable.dart';

abstract class DepositEvent extends Equatable {
 const DepositEvent();
}

class Deposit extends DepositEvent {
 final double amount;

 const Deposit({required this.amount});

 @override
 List<Object> get props => [amount];
}