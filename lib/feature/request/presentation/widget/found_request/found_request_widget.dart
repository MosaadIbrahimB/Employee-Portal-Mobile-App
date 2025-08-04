import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/data/report_model.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/report_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/control/all_request/all_request_cubit.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/control/all_request/all_request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../management_request/item_request_widget.dart';
import '../../../data/model/response_admin_financial_model.dart';
import '../../control/request/request_cubit.dart';
import '../../control/tab_switcher/tab_switcher_cubit.dart';
import '../custom_dropdown_button.dart';

class FoundRequestWidget extends StatelessWidget {
  const FoundRequestWidget({super.key, required this.response});
final  List<ResponseAdminFinancialModel> response;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .75,
      child: Stack(
        children: [
      Container(
        margin: EdgeInsets.only(bottom: 50).r,
        child: ListView.builder(
          itemCount:response.length ,
          itemBuilder:(context, index) =>
            ItemRequestWidget(model: response[index]) ,

            ),
      ),

          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: SizedBox(
                width: 150.w,
                child: CustomDropdownButton()),
          ),

          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   child: Align(
          //     alignment: AlignmentDirectional.bottomEnd,
          //     child: GestureDetector(
          //       onTap: (){
          //         context.read<RequestCubit>().changePage(1);
          //         context.read<TabSwitcherCubit>().changeTab(0);
          //       },
          //       child: Container(
          //         width: 72.w,
          //         height: 72.h,
          //         decoration: BoxDecoration(
          //           color: AppColor.primary,
          //           borderRadius: BorderRadius.circular(12).r,
          //         ),
          //         child: const Icon(Icons.add, color: Colors.white, size: 30),
          //       ),
          //     )
          //   ),
          // ),
        ],
      ),
    );
  }
}
