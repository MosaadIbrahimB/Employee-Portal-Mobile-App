import 'package:flutter_bloc/flutter_bloc.dart';

class TabSwitcherCubit extends Cubit<int> {
  TabSwitcherCubit() : super(0);

  changeTab(int index){
    emit(index);
  }
}