import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/over_time/presentation/control/get_reviewer_over_time/get_reviewer_over_time_cubit.dart';
import '../../../../../core/service/dependency_injection/depend_inject.dart';
import '../../../../request/presentation/control/request/request_cubit.dart';
import '../../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../../../request/presentation/widget/app_bar_request_widget.dart';

import '../../control/get_reviewer_over_time/get_reviewer_over_time_state.dart';
import '../tab_of_app_bar_switcher_widget.dart';
import 'item_of_tab_credits_over_time_widget.dart';

class TabCreditsOverTimeWidget extends StatelessWidget {
  const TabCreditsOverTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetReviewerOverTimeCubit>()..getReviewerOverTime(),
      child: Column(
        children: [
          SizedBox(height: 12.h),
          AppBarRequestWidget(
            icon: Icons.close,
            title: "اعتمادات الاضافى",
            onTap: () {
              context.read<RequestCubit>().changePage(0);
              context.read<TabSwitcherCubit>().changeTab(0);
            },
          ),
          SizedBox(height: 12.h),
          TabOfAppBarSwitcherWidget(
              tabs: ['اضافة طلب اضافى', 'طلباتى للاضافى','اعتمادات الاضافى']),
          SizedBox(height: 12.h),        
        BlocBuilder<
            GetReviewerOverTimeCubit,
            GetReviewerOverTimeState>(
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
                    .map((e) => ItemOfTabCreditsOverTimeWidget(model: e))
                    .toList(),
              );
            },
          ),

        ],
      ),
    );
  }
}
