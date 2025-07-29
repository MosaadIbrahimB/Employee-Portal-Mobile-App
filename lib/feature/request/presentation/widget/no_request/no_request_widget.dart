import 'package:employee_portal_mobile_app/feature/request/presentation/control/financial_request_type/get_financial_request_type_cubit.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/control/financial_request_type/get_financial_request_type_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../data/model/financial_request_type_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class NoRequestWidget extends StatelessWidget {
  const NoRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 215.h,
          padding: EdgeInsets.symmetric(horizontal: 10).r,
          decoration: BoxDecoration(
            border: Border.all(color: context.color.outline),
            borderRadius: BorderRadius.circular(8).r,
            color: context.color.surface,
          ),
          child: Center(
            child: SizedBox(
              width: 257.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "لا يوجد اي طلبات",
                    style: AppTextStyle.iBMP24w600Black.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "يتم اخد اجازة لاسباب صحية او اضطرارية ",
                    style: context.text.titleMedium,
                  ),
                  Text("فقط", style: context.text.titleMedium),
                  SizedBox(height: 12.h),

                  BlocBuilder<GetFinancialRequestTypeCubit, GetFinancialRequestTypeState>(
                    builder: (context, state) {
                      if (state.isLoading == true) {
                        return const Center(child: Text('جارى التحميل ...'));
                      }
                      if (state.errorMessage != null) {
                        return Text(state.errorMessage!);
                      }

                      return DropdownButtonHideUnderline(
                        child: DropdownButton2<FinancialRequestTypeModel>(
                          isExpanded: true,
                          value: state.selectedRequestType,
                          hint: Text(
                            'طلب جديد',
                            style: context.text.bodyLarge!.copyWith(
                              color: context.color.surface,
                            ),
                          ),

                          items:
                              state.response!.map((request) {
                                return DropdownMenuItem<
                                  FinancialRequestTypeModel
                                >(
                                  value: request,
                                  child: Text(request.name ?? " لا يوجد نوع طلبات للمستخدم"),

                                );
                              }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              context
                                  .read<GetFinancialRequestTypeCubit>()
                                  .selectedRequestType(value);
                            }
                          },
                          buttonStyleData: ButtonStyleData(
                            height: 50.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12).r,
                              color: context.color.primary,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                          ),
                          iconStyleData: IconStyleData(
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: context.color.surface,
                            ),
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12).r,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
// context.read<RequestCubit>().changePage(1);
// context.read<TabSwitcherCubit>().changeTab(0);
