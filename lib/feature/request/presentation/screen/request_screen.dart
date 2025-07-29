import 'dart:developer';

import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_screen_body.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_type/management_request/tab_mangement_request/all_management_request_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/service/dependency_injection/depend_inject.dart';
import '../../data/model/financial_request_type_model.dart';
import '../control/dropdown/dropdown_cubit.dart';
import '../control/financial_request_type/get_financial_request_type_cubit.dart';
import '../control/financial_request_type/get_financial_request_type_state.dart';
import '../control/request/request_cubit.dart';
import '../control/tab_switcher/tab_switcher_cubit.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  static final List<Widget> screen =
  [
    RequestScreenBody(),
    AllManagementRequestWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DropdownCubit>(create: (context) => DropdownCubit()),
        BlocProvider<RequestCubit>(create: (context) => RequestCubit()),
        BlocProvider<TabSwitcherCubit>(create: (context) => TabSwitcherCubit()),
        BlocProvider(create: (context) => sl<GetFinancialRequestTypeCubit>()..getFinancialRequest()),
      ],
      child: SafeArea(
        child: BlocBuilder<GetFinancialRequestTypeCubit,GetFinancialRequestTypeState>(
          builder: (context, state) {
            if (state.isLoading== true ) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.errorMessage != null) {
              return Center(child: Text(state.errorMessage!));
            }
            List<FinancialRequestTypeModel> financialRequest = state.response ?? [];

            return RequestScreenBody();
          },




        // child: BlocBuilder<RequestCubit,int>(
        //   builder: (context,state) {
        //     return SingleChildScrollView(child: screen[state]);
        //   }
        // ),
      ),
    ));
  }
}

