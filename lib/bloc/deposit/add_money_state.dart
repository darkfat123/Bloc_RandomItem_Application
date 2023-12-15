import 'package:equatable/equatable.dart';

abstract class DepositState extends Equatable {
 const DepositState();
}

class DepositInitial extends DepositState {
 @override
 List<Object> get props => [];
}

class DepositSuccess extends DepositState {
 final double amount;

 const DepositSuccess({required this.amount});

 @override
 List<Object> get props => [amount];
}

class DepositFailure extends DepositState {
 final String message;

 const DepositFailure({required this.message});

 @override
 List<Object> get props => [message];
}