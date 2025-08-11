import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/presentation/control/get_reviewer_financial_request/get_reviewer_financial_request_cubit.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/presentation/control/get_reviewer_financial_request/get_reviewer_financial_request_state.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_tab_of_app_bar_switcher.dart';
import '../../../../../core/service/dependency_injection/depend_inject.dart';
import '../../../../request/presentation/control/request/request_cubit.dart';
import '../../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../../../request/presentation/widget/app_bar_request_widget.dart';


class TabCreditsMissionRequestWidget extends StatelessWidget {
  const TabCreditsMissionRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetReviewerFinancialRequestCubit>()..getReviewerFinancialRequest(),
      child: Column(
        children: [
          SizedBox(height: 12.h),
          AppBarRequestWidget(
              icon: Icons.close,
              title: "مالى قيد الاعتماد",
              onTap: () {
                context.read<RequestCubit>().changePage(0);
                context.read<TabSwitcherCubit>().changeTab(0);

              }
          ),
          SizedBox(height: 12.h),
          RequestTabOfAppBarSwitcher(tabs: ['طلب مالى', 'الاعتمادات المالية'],),
          // SizedBox(height: 12.h),
          // AppBarTabManagementRequestWidget(),
          SizedBox(height: 12.h),
          BlocBuilder<
              GetReviewerFinancialRequestCubit,
              GetReviewerFinancialRequestState>(
            builder: (context, state) {
              if(state.isLoading==true){
                return Center(child: CircularProgressIndicator());
              }
              if (state.errorMessage!=null) {
                return SizedBox(
                  height: 50.h,
                  child: Center(
                    child: Text(
                      state.errorMessage??"حدث خطأ ما",
                    ),
                  ),
                );
              }
              if (state.response == null || state.response!.isEmpty) {
                return SizedBox(
                  height: 50.h,
                  child: Center(
                    child: Text(
                      "لا توجد طلبات قيد الاعتماد",
                    ),
                  ),
                );
              }
              return Column(
                children:
                state.response!
                    .map((e) => ItemOfTabCreditsRequestWidget(model: e))
                    .toList(),
              );
            },
          ),

        ],
      ),
    );
  }
}
