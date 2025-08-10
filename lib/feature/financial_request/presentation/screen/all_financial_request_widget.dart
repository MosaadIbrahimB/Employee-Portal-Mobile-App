import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/presentation/widget/tab_financial_request/tab_financial_request_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../widget/add_financial_request/add_financial_request_widget.dart';
import '../widget/details_financial_request/details_item_of_request_widget.dart';
import '../widget/tab_credits_financial_request/tab_credits_financial_request_widget.dart';

class AllFinancialRequestWidget extends StatelessWidget {
  const AllFinancialRequestWidget({super.key});

  static final List<Widget> listBody = [
    TabFinancialRequestWidget(),
    TabCreditsFinancialRequestWidget(),
    AddFinancialRequestWidget(),
    DetailsItemOfRequestWidget()
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Padding(
      padding: const EdgeInsets.all(8.0).r,
      child: BlocBuilder<TabSwitcherCubit, int>(
        builder: (context, state) {
          return listBody[state];
        },
      ),
    ),);
  }
}











