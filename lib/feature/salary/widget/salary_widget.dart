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
            border: Border.all(color: Colors.black12, width: 1.w),
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
                    color: Color(0xff0072C3),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    salaryWidgetModel!.date ?? "يونيو 2024",
                    style: AppTextStyle.iBMP12w500MidnightBlue.copyWith(
                      color: Color(0xff3D4966),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Color(0xff0072C3),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    salaryWidgetModel?.money ?? "34,08765400 EG",
                    style: AppTextStyle.iBMP12w500MidnightBlue.copyWith(
                      color: Color(0xff3D4966),
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
                      style: AppTextStyle.iBMP12w500MidnightBlue.copyWith(
                        color: Color(0xff3D4966),
                      ),
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
