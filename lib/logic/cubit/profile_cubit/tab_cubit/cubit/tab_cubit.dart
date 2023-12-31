import 'package:bloc/bloc.dart';

part 'tab_state.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit() : super(TabInitial());

  int currentIndex = 0;
  void changeIndex(index) {
    currentIndex = index;
    emit(TabChangeIndexState());
  }
}
