import '../../../../core/utils/import_file.dart';
import '../control/money_cubit/money_cubit.dart';

class TotalInstallmentsWidget extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  const TotalInstallmentsWidget({super.key, required this.title, this.controller});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.text.bodyMedium),
        SizedBox(height: 8.h),
        Container(
          height: 52.h,
          padding: EdgeInsets.symmetric(vertical: 14,horizontal: 8).r,
          decoration: BoxDecoration(
            // color: Colors.red,
            border: Border.all(color: context.color.outline),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 70.w,
                child: TextFormField(
                  onChanged: (_) {
                    context.read<MoneyCubit>().calculateOneInstallment();

                  },
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: '0',
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.only(bottom: 0)
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
