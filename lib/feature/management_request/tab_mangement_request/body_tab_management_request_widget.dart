import 'package:employee_portal_mobile_app/feature/layout/export_layout_file.dart';
import 'package:employee_portal_mobile_app/feature/splash/presentation/widget/custom_button_widget.dart';
import '../../request/presentation/control/get_employee_administrative_request/get_employee_administrative_request_cubit.dart';
import '../../request/presentation/control/get_employee_administrative_request/get_employee_administrative_request_state.dart';
import '../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../item_request_widget.dart';


class BodyTabManagementRequestWidget extends StatelessWidget {
  const BodyTabManagementRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppBarTabManagementRequestWidget(),
        // SizedBox(height: 12.h),
        BlocBuilder<GetEmployeeAdministrativeRequestCubit, GetEmployeeAdministrativeRequestState>(
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
                  child: Center(child: Text("لا توجد طلبات ادارية")));
            }

            return Column(
              children:
              state.response!
                  .map((e) => ItemRequestWidget(model: e))
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
