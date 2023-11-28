import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_money_event.dart';
part 'add_money_state.dart';

class AddMoneyBloc extends Bloc<AddMoneyEvent, AddMoneyState> {
  AddMoneyBloc() : super(AddMoneyInitial()) {
    on<AddMoneyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
