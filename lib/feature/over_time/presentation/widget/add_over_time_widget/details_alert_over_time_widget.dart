import '../../../../../core/component/custom_nots_of_details_screen_widget.dart';
import '../../../../../core/component/custom_title_and_value_widget.dart';
import '../../../../../core/utils/import_file.dart';
import '../../../../../generated/assets.dart';
import '../../../../administrative_request/presentation/widget/app_bar_management_request_widget.dart';
import '../../../../mission_request/presentation/widget/from_date_widget.dart';
import '../../../../mission_request/presentation/widget/from_to_mission_widget.dart';
import '../../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../../../request/presentation/widget/add_document_button_widget.dart';
import '../../../data/model/alert_model.dart';

class DetailsAlertOverTimeWidget extends StatelessWidget {
  const DetailsAlertOverTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabSwitcherCubit, int>(
      builder: (context, state) {
        AlertModel model = context.read<TabSwitcherCubit>().getModel();

        return Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            // معتمده - تحت الطلب -مرفوض
            AppBarAdministrativeRequestWidget(
                icon: Icons.close,
                title: "تفاصيل اليوم",
                onTap: () {
                  context.read<TabSwitcherCubit>().changeTab(0);
                }
            ),
            SizedBox(height: 16.h),
            FromDateWidget(date: model.date.toString().substring(0,10)?? "غير متاح"),
            SizedBox(height: 16.h),
            CustomTitleAndValueWidget(
              title: "النوع",
              value: model.transactionType ?? "غير متاح",
            ),

            SizedBox(height: 16.h),
            CustomTitleAndValueWidget(
              title: "نوع التنبيه",
              value: model.alertType ?? "غير متاح",
            ),
            SizedBox(height: 16.h),
            CustomTitleAndValueWidget(
              title: "الوقت",
              value: model.time ?? "غير متاح",
            ),
            SizedBox(height: 16.h),
            CustomTitleAndValueWidget(
              title: "الوردية",
              value: model.timeTable ?? "غير متاح",
            ),
            SizedBox(height: 16.h),
            CustomTitleAndValueWidget(
              title: "المدة",
              value: model.duration.toString() ?? "غير متاح",
            ),
            SizedBox(height: 16.h),

            AddDocumentButtonWidget(
              onTap: () {},
              title: "الوثائق",
              widget: SizedBox(
                width: 20.w,
                height: 25.h,
                child: Image.asset(Assets.requestPdf),
              ),
            ),
            SizedBox(height: 16.h),
            CustomNotsOfDetailsScreenWidget(notText: model.notes,),
          ],
        );
      },
    );
  }
}
