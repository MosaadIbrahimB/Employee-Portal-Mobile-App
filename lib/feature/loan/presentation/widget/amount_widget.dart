import '../../../../core/utils/import_file.dart';
import '../../../../generated/assets.dart';

class AmountWidget extends StatelessWidget {
  final String title;
  const AmountWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(vertical: 14,horizontal: 8).r,
      decoration: BoxDecoration(
        color: context.color.onPrimaryFixed,
        border: Border.all(color: context.color.outline),
        borderRadius: BorderRadius.circular(8).r,
      ),
      child: Center(
        child: Row(
          children: [
            SvgPicture.asset(Assets.dayMoney,color: context.color.primary,),
            SizedBox(width: 8.w),
            Text("EGP",style: context.text.bodyMedium!.copyWith(color: context.color.shadow),),
            SizedBox(width: 12.w),
            Text(title, style: context.text.bodyMedium),

          ],
        ),
      ),
    );
  }
}
