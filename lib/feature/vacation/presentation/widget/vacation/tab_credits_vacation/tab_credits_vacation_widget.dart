import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/get_vacation_requests/get_vacation_requests_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/get_vacation_requests/get_vacation_requests_state.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation/tab_credits_vacation/item_of_tab_credits_vacation_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabCreditsVacationWidget extends StatelessWidget {
  const TabCreditsVacationWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
        GetVacationRequestsCubit,
        GetVacationRequestsResponseState>(
      builder: (context, state) {
        if (state.isLoading == true && state.response == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.errorMessage != null) {
          return const Center(child: Text(" معتمدة لا توجد طلبات إجازة"));
        }
        if (state.response != null && state.response!.isNotEmpty) {
          return Column(
            children: [
              Column(
                children:
                state.response!
                    .map((e) => ItemOfTabCreditsVacationWidget(model:e))
                    .toList(),
              ),


            ],

          );
        }
        return Text("No Data");
      },
    );
  }
}
