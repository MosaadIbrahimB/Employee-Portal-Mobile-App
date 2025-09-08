import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/feature/over_time/data/model/response_over_time_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../control/get_employee_over_time/get_employee_over_time_cubit.dart';
import '../../control/get_employee_over_time/get_employee_over_time_state.dart';
import '../item_over_time_widget.dart';

class BodyTabOverTimeWidget extends StatelessWidget {
  const BodyTabOverTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
  
    return   SizedBox(
      height: context.height,
      child:         BlocBuilder<GetEmployeeOverTimeCubit, GetEmployeeOverTimeState>(
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
                child: Center(child: Text("لا توجد طلبات ")));
          }
          List<ResponseOverTimeModel>? response = state.response;

          return ListView.builder(
            itemCount: response!.length,
            itemBuilder: (context, index) {
             // return Text(response[index].status!);
              return ItemOverTimeWidget(model: response[index]);
            },
          );
        },
      ),

    );
  }
}
/*
        Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<TabSwitcherCubit>(context).changeTab(3);
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

 */