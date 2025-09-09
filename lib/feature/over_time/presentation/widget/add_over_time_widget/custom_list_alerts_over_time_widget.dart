import '../../../../../core/utils/import_file.dart';
import '../../control/get_alerts_over_time/get_alerts_over_time_cubit.dart';
import '../../control/get_alerts_over_time/get_alerts_over_time_state.dart';
import 'item_of_list_over_time_widget.dart';

class CustomListAlertsOverTimeWidget extends StatelessWidget {
  const CustomListAlertsOverTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<GetAlertsOverTimeCubit, GetAlertsOverTimeState>(
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
                "لا توجد طلبات ",
              ),
            ),
          );
        }
        final response=state.response;
        if(response!=null&&response.isNotEmpty){
          return SizedBox(
            height: context.height,
            child: ListView.builder(
              itemCount: response.length,
              itemBuilder: (context, index) =>
                  ItemOfListOverTimeWidget(model: response[index],)
                ),
          );
        }
        return SizedBox();
      },
    );
  }
}
