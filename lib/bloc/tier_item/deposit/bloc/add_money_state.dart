part of 'add_money_bloc.dart';

sealed class AddMoneyState extends Equatable {
  const AddMoneyState();
  
  @override
  List<Object> get props => [];
}

final class AddMoneyInitial extends AddMoneyState {}
