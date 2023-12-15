part of 'tier_item_bloc.dart';

abstract class TierItemEvent extends Equatable {
  const TierItemEvent();

  @override
  List<Object> get props => [];
}

class GenerateRandomNumber extends TierItemEvent {
  final double cost;

  GenerateRandomNumber({required this.cost});
}
