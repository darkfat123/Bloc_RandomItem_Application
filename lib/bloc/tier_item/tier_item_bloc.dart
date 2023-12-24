import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tier_item_event.dart';
part 'tier_item_state.dart';

class TierItemBloc extends Bloc<TierItemEvent, TierItemState> {
  double money;

  TierItemBloc({required this.money})
      : super(MoneyUpdate(money: money));

  @override
  Stream<TierItemState> mapEventToState(TierItemEvent event) async* {
    if (event is GenerateRandomNumber) {
      yield* _mapGenerateItemToState();
    }
  }

  int _generateRandomNumber() {
    final random = Random();
    return random.nextInt(150) + 1;
  }

  Stream<TierItemState> _mapGenerateItemToState() async* {
    final randomNumber = _generateRandomNumber();

    if (money >= 20) {
      // Deduct money
      money -= 20;

      // Update money state
      yield MoneyUpdate(money: money);

      // Emit the corresponding item tier state
      if (randomNumber >= 1 && randomNumber <= 5) {
        yield SPlusTierItem();
      } else if (randomNumber >= 6 && randomNumber <= 20) {
        yield STierItem();
      } else if (randomNumber >= 21 && randomNumber <= 50) {
        yield ATierItem();
      } else if (randomNumber >= 51 && randomNumber <= 90) {
        yield BTierItem();
      } else {
        yield CTierItem();
      }
    } else {
      yield NoMoney();
    }
  }
}
