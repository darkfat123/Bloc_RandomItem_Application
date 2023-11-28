import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tier_item_event.dart';
part 'tier_item_state.dart';

class TierItemBloc extends Bloc<TierItemEvent, TierItemState> {
  TierItemBloc() : super(TierItemInitial());

  @override
  Stream<TierItemState> mapEventToState(TierItemEvent event) async* {
    if (event is GenerateRandomNumber) {
      final randomNumber = _generateRandomNumber();
      yield _mapNumberToTier(randomNumber);
    }
  }

  int _generateRandomNumber() {
    final random = Random();
    return random.nextInt(150) + 1; // สุ่มตัวเลข 1-100
  }

  TierItemState _mapNumberToTier(int number) {
    if (number >= 1 && number <= 5) {
      return SPlusTierItem();
    } else if (number >= 6 && number <= 20) {
      return STierItem();
    } else if (number >= 21 && number <= 50) {
      return ATierItem();
    } else if (number >= 51 && number <= 90) {
      return BTierItem();
    } else {
      return CTierItem();
    }
  }
}
