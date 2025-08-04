import 'package:employee_portal_mobile_app/feature/home/data/report_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/response_admin_financial_model.dart';

class TabSwitcherCubit extends Cubit<int> {
  TabSwitcherCubit() : super(0);
 late ResponseAdminFinancialModel _model;

  changeTab(int index){
    emit(index);
  }
  setModel(ResponseAdminFinancialModel model){
    _model = model;
  }
  getModel(){
    return _model;
  }
}