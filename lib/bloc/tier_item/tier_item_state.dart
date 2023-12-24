part of 'tier_item_bloc.dart';

abstract class TierItemState extends Equatable {
  const TierItemState();

  @override
  List<Object> get props => [];
}

class TierItemInitial extends TierItemState {}

class SPlusTierItem extends TierItemState {
  @override
  List<Object> get props => [];
}

class STierItem extends TierItemState {
  @override
  List<Object> get props => [];
}

class ATierItem extends TierItemState {
  @override
  List<Object> get props => [];
}

class BTierItem extends TierItemState {
  @override
  List<Object> get props => [];
}

class CTierItem extends TierItemState {
  @override
  List<Object> get props => [];
}

class NoMoney extends TierItemState {
  @override
  List<Object> get props => [];
}

class MoneyUpdate extends TierItemState {
  final double money;


  const MoneyUpdate({required this.money});

  @override
  List<Object> get props => [money];
}

