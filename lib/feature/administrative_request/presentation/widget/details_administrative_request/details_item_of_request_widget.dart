import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/presentation/widget/app_bar_management_request_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/add_document_button_widget.dart';
import 'package:employee_portal_mobile_app/generated/assets.dart';
import '../../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../../data/model/response_administrative_model.dart';
import 'reviewer_widget.dart';
import 'nots_details_widget.dart';
import 'submission_date_widget.dart';
import 'time_widget.dart';
import 'type_widget.dart';

class DetailsItemOfRequestWidget extends StatelessWidget {
  const DetailsItemOfRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabSwitcherCubit, int>(
      builder: (context, state) {

        ResponseAdministrativeModel model = context.read<TabSwitcherCubit>().getModel();
        return Column(
          children: [
            SizedBox(height: 16.h),
            // معتمده - تحت الطلب -مرفوض
            Row(
              children: [
                AppBarAdministrativeRequestWidget(
                    icon: Icons.close,
                    title: "تفاصيل طلب ادارى",
                    onTap: () {
                      context.read<TabSwitcherCubit>().changeTab(0);
                    }
                ),
                  Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 3).r,
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.onSecondary),
                  child: Text(
                    model.status ?? "الحالة",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),

              ],
            ),

            SizedBox(height: 16.h),
            //   التاريخ
            SubmissionDateWidget(dateRequest: model.date??"غير متاح"),
            SizedBox(height: 16.h),
            //النوع
            TypeWidget(requestTypeName: model.requestTypeName),
            SizedBox(height: 16.h),
            TimeWidget(time: "9AM"),
            //المراجع الاول الثانى
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  model.reviewers!
                      .map((e) => ReviewerWidget(reviewer: e))
                      .toList(),
            ),
            SizedBox(height: 16.h),
            AddDocumentButtonWidget(
              onTap: (){},
              title: "الوثائق",
              widget: SizedBox(
                width: 20.w,
                height: 25.h,
                child: Image.asset(Assets.requestPdf),
              ),
            ),
            SizedBox(height: 16.h),
            NotsDetailsWidget(nots: model.notes,),
            SizedBox(height: 16.h),

          ],
        );
      },
    );
  }
}

