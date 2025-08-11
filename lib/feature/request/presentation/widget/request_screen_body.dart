import 'package:employee_portal_mobile_app/feature/layout/export_layout_file.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/control/all_request/all_request_state.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/found_request/found_request_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/no_request/no_request_widget.dart';
import '../control/all_request/all_request_cubit.dart';

class RequestScreenBody extends StatelessWidget {
   RequestScreenBody({super.key});
   List<dynamic>? response;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25.h),
            Text("الطلبات", style: context.text.displayMedium),
            // AppTextStyle.iBMP24w600
            // SizedBox(height: 34.h),
            // HeaderRequestScreenWidget(),
            SizedBox(height: 24.h),
            BlocBuilder<AllRequestCubit,AllRequestState>(
              builder: (context, state) {
                response=state.response;
                if(state.isLoading==true) {
                  return Center(child: CircularProgressIndicator());
                }
                if(state.errorMessage!=null) {
                  return Center(child: Text(state.errorMessage.toString()));
                }
                if(response!.isEmpty) {
                  return NoRequestWidget();
                }
                return FoundRequestWidget(response: response!);
            },
            ),
          ],
        ),
      ),
    );
  }
}
