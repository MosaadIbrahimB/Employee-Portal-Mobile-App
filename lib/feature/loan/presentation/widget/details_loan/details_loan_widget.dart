import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/presentation/widget/app_bar_management_request_widget.dart';
import '../../../../../generated/assets.dart';
import '../../../../administrative_request/presentation/widget/details_administrative_request/nots_details_widget.dart';
import '../../../../administrative_request/presentation/widget/details_administrative_request/reviewer_widget.dart';
import '../../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../../../request/presentation/widget/add_document_button_widget.dart';
import '../../../data/model/response_loan_model.dart';
import '../text_amount_widget.dart';
import 'type_widget.dart';

class DetailsLoanWidget extends StatelessWidget {
  const DetailsLoanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabSwitcherCubit, int>(
      builder: (context, state) {
        LoanModel model = context.read<TabSwitcherCubit>().getModel();
        double valueOneInstallment = (model.value! / model.installments!);
        return Column(
          children: [
            SizedBox(height: 16.h),
            // معتمده - تحت الطلب -مرفوض
            Row(
              children: [
                AppBarAdministrativeRequestWidget(
                  icon: Icons.close,
                  title: "تفاصيل السلفة",
                  onTap: () {
                    context.read<TabSwitcherCubit>().changeTab(0);
                  },
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 3).r,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  child: Text(
                    model.status ?? "الحالة",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            //النوع
            TypeWidget(
              requestTypeName: model.loanTypeName,
              installments: model.installments.toString(),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: TextAndValueWidget(
                    title: "المبلغ ",
                    value: model.value.toString(),
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: TextAndValueWidget(
                    title: "قيمة القسط الواحد",
                    value: "${valueOneInstallment ?? 0}",
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: TextAndValueWidget(
                    title: "تاريخ تقديم الطلب ",
                    value: model.startDate.toString().substring(0,10),
                  isDate: true,
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: TextAndValueWidget(
                    title: "تاريخ الاستلام",
                    value: model.lastDate.toString().substring(0,10),
                    isDate: true,
                  ),
                ),
              ],
            ),

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
            NotsDetailsWidget(nots: model.attachments,),
            SizedBox(height: 16.h),
          ],
        );
      },
    );
  }
}

