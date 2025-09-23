import '../../../../core/utils/import_file.dart';
import '../../../../generated/assets.dart';

class TextAndValueWidget extends StatelessWidget {
  final String? title;
  final String? value;
  final bool? isDate;
  final Color? bgColor;

  const TextAndValueWidget({
    super.key,
    this.title,
    this.value,
    this.isDate = false,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bgColor==null ?  Text("$title", style: context.text.bodyMedium): SizedBox.shrink(),
        bgColor==null ? SizedBox(height: 8.h): SizedBox.shrink(),
        Container(
          // height: 70.h,
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8).r,
          decoration: BoxDecoration(
            color:bgColor ?? context.color.onPrimaryContainer,
            border: Border.all(color: context.color.outline),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bgColor!=null ?  Text("$title", style: context.text.bodyMedium): SizedBox.shrink(),
              SizedBox(height: 8.h),
              Row(
                children: [
                  isDate == true
                      ? Icon(
                        Icons.calendar_today_outlined,
                        size: 15,
                        color: context.color.shadow,
                      )
                      : SvgPicture.asset(
                        Assets.dayMoney,
                        color: context.color.shadow,
                      ),
                  isDate == true
                      ? SizedBox.shrink()
                      : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 8.w),
                          Text(
                            "EGP",
                            style: context.text.bodyMedium!.copyWith(
                              color: context.color.shadow,
                            ),
                          ),
                        ],
                      ),
                  SizedBox(width: 8.w),
                  SizedBox(
                    width: 120.w,
                    child: Text("$value", style: context.text.bodyMedium),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
