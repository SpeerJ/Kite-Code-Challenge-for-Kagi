import 'package:bloc/bloc.dart';

class ShowingSettingsCubit extends Cubit<bool> {
  ShowingSettingsCubit(super.initialState);

  void toggle() {
    emit(!state);
  }
}