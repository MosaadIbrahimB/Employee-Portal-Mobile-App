import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/core/configure/route/app_route.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/salary/presentation/data/salary_widget_model.dart';

class SalaryWidget extends StatelessWidget {
  const SalaryWidget({super.key, this.salaryWidgetModel});

  final SalaryWidgetModel? salaryWidgetModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 19).r,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12).r,
            border: Border.all(color: context.color.outline, width: 1.w),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "assets/image/home/opening-times.svg",
                    width: 18.w,
                    height: 18.h,
                    color:context.color.primaryContainer,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    salaryWidgetModel!.date ?? "يونيو 2024",
                    style: context.text.bodySmall!.copyWith(
                        color: AppColor.gray70
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    color:context.color.primaryContainer,// Color(0xff0072C3)
                    size: 20.h,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    salaryWidgetModel?.money ?? "34,08765400 EG",
                    style: context.text.bodySmall!.copyWith(
                      color: AppColor.gray70
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoute.detailSalary);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "تفاصيل",
                      style: context.text.bodySmall,
                    ),
                    SizedBox(width: 8.w),
                    Icon(Icons.arrow_forward, size: 22),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
