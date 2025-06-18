import 'package:employee_portal_mobile_app/core/component/header_core_widget.dart';
import 'package:employee_portal_mobile_app/core/service/dependency_injection/depend_inject.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/get_employee_vacations/get_employee_vacations_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/get_employee_vacations/get_employee_vacations_state.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/vacation_cubit/vacation_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation/tab_all_vacation/item_tab_all_vacation_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../vacation_request/vacation_request_widget.dart';


class TabAllVacationWidget extends StatelessWidget {
  const TabAllVacationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetEmployeeVacationsCubit>()..getEmployeeVacations(),
      child: Column(
        children: [
          HeaderCoreWidget(title: "جميع الاجازات", subTitle: "الترتيب حسب"),
          SizedBox(height: 12.h),
          BlocBuilder<GetEmployeeVacationsCubit, GetEmployeeVacationsState>(
            builder: (context, state) {
            List response=  state.response?? [];
              if (state.isLoading==true) {
                return  Center(child: Column(
                  children: [
                    SizedBox(height: context.height * 0.25,),
                    CircularProgressIndicator(),
                  ],
                ));
              }
              if (state.errorMessage?.isNotEmpty?? false) {
                return Center(child: Text(state.errorMessage??"Error"));
              }
              return Column(
                children:
                response
                    .map(
                      (e) =>
                      GestureDetector(
                        onTap: () {
                          context.read<VacationCubit>().changeTab(3);
                          context.read<VacationCubit>().setEmployeeVacationsModel(e);
                        },
                        child: ItemTabAllVacationWidget(employeeVacationsModel: e),
                      ),
                )
                    .toList(),
              );
            },
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: GestureDetector(
              onTap: () {
                context.read<VacationCubit>().changeTab(1);
                print("object");
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
      ),
    );
  }
}
