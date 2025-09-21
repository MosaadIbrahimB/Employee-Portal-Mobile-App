
import '../../../../core/utils/import_file.dart';
import '../../../../generated/assets.dart';

class TotalMoneyWidget extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  const TotalMoneyWidget({super.key, required this.title, this.controller});

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
              SvgPicture.asset(Assets.dayMoney,color: context.color.shadow,),
              SizedBox(width: 8.w),
              Text("EGP",style: context.text.bodyMedium!.copyWith(color: context.color.shadow),),
              SizedBox(width: 8.w),
              SizedBox(
                width: 70.w,
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '0.0',
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
