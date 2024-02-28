import 'package:coinomi/features/main/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenState.initial());

 void onSelectTab(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
