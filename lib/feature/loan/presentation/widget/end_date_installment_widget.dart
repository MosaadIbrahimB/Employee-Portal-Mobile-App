import '../../../../core/utils/import_file.dart';
import '../../../request/presentation/control/date_cubit/date_cubit.dart';
import '../../../request/presentation/control/date_cubit/date_state.dart';

class EndDateInstallmentWidget extends StatelessWidget {
  const EndDateInstallmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateCubit, DateState>(
      builder: (context, state) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text("تاريخ الاستلام", style: context.text.bodyMedium),
            ),
            SizedBox(height: 8.h),
            Container(
              height: 52.h,
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 8).r,
              decoration: BoxDecoration(
                // color: Colors.red,
                border: Border.all(color: context.color.outline),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 15,
                    color: context.color.shadow,
                  ),
                  SizedBox(width: 8.w),
                  state.toDate?.month == DateTime.now().month &&
                      state.toDate?.year == DateTime.now().year
                      ? Text("0", style: TextStyle(fontWeight: FontWeight.bold))
                      : Text("${state.formattedToDate}")
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
