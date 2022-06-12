import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'toggle_state.dart';

class ToggleCubit extends Cubit<ToggleState> {
  ToggleCubit() : super(ToggleInitial());

  bool isEnabled = false;

  void toggleSwitch(){
    if(!isEnabled){
      isEnabled = true;
      emit(ToggleOnState());
    }else{
      isEnabled = false;
      emit(ToggleOffState());
    }
  }
}
