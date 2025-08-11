import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../control/get_employee_mission/get_employee_mission_cubit.dart';
import '../../control/get_employee_mission/get_employee_mission_state.dart';
import '../../control/get_mission_request/get_mission_request_cubit.dart';
import '../../control/get_mission_request/get_mission_request_state.dart';
import '../item_mission_request_widget.dart';

class BodyTabMissionRequestWidget extends StatelessWidget {
  const BodyTabMissionRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppBarTabManagementRequestWidget(),
        // SizedBox(height: 12.h),
        BlocBuilder<GetEmployeeMissionCubit, GetEmployeeMissionRequestState>(
          builder: (context, state) {
            if (state.isLoading==true) {
              return Center(child: CircularProgressIndicator());
            }
            if (state.errorMessage != null) {
              return Center(child: Text("حدث خطأ ما${state.errorMessage}"));
            }
            if( state.response == null || state.response!.isEmpty) {
              return SizedBox(
                  height: 50.h,
                  child: Center(child: Text("لا توجد طلبات مأموريات")));
            }

            return Column(
              children:
              state.response!
                  .map((e) => ItemMissionRequestWidget(model: e))
                  .toList(),
            );
          },
        ),
        SizedBox(height: 21.h),

        Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<TabSwitcherCubit>(context).changeTab(2);
            },
            child: Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(12).r,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),

      ],
    );
  }
}
