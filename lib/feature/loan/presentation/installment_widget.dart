import '../../../core/utils/import_file.dart';
import 'control/money_cubit/money_cubit.dart';
import 'control/money_cubit/money_state.dart';

class InstallmentWidget extends StatelessWidget {
  const InstallmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoneyCubit, MoneyState>(
      builder: (context, state) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text("قيمة القسط الواحد", style: context.text.bodyMedium),
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
                children: [Text(state.installmentValue.toStringAsFixed(2))],
              ),
            ),
          ],
        );
      },
    );
  }
}
