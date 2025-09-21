import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../control/get_employee_loan/get_employee_loan_cubit.dart';
import '../../control/get_employee_loan/get_employee_loan_state.dart';
import '../item_loan_request_widget.dart';

class BodyLoanWidget extends StatelessWidget {
  const BodyLoanWidget({super.key});

  @override
  Widget build(BuildContext context) {



    return   Column(
      children: [
        SizedBox(
          height: context.height* 0.65,
          child:  BlocBuilder<GetEmployeeLoanCubit, GetEmployeeLoanState>(
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
             final response = state.response;

              return ListView.builder(
                itemCount: response!.length,
                itemBuilder: (context, index) {
                  return ItemLoanRequestWidget(model: response[index]);
                },
              );
            },
          ),

        ),
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
