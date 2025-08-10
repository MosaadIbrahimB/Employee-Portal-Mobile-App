import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/domain/use_case/get_reviewer_financial_request_use_case.dart';
import '../../../../../core/service/dependency_injection/depend_inject.dart';
import '../../../../request/data/model/response_admin_financial_model.dart';
import '../../../../vacation/data/model/approve_cancel/approve_cancel_request_model.dart';
import '../../../../vacation/presentation/control/approve_cancel_request/approve_cancel_request_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../vacation/presentation/control/approve_cancel_request/approve_cancel_request_state.dart';
import '../../../data/model/response_financial_model.dart';
import '../../control/get_reviewer_financial_request/get_reviewer_financial_request_cubit.dart';

class ItemOfTabCreditsRequestWidget extends StatelessWidget {
  const ItemOfTabCreditsRequestWidget({super.key, required this.model});

  final ResponseFinancialModel model;

  static const IconData moreH = IconData(0xe402, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => sl<ApproveCancelRequestCubit>(),
  child: BlocBuilder<ApproveCancelRequestCubit, ApproveCancelRequestState>(
  builder: (context, state) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(12).r,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12).r,
        border: Border.all(color: Colors.black12, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // معتمده - تحت الطلب -مرفوض - التاريخ
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
              SizedBox(width: 3.w),
              Text(
                model.requestTypeName ?? "requestTypeName",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Spacer(),

              GestureDetector(
                onTapDown: (details) {
                  dropdownMenu(context, details);
                },

                child: Icon(moreH),
              ),
              // Icon(moreH)
            ],
          ),

          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(model.empName ?? "اسم الموظف  : محمد فتحى محمد غانم"),
              Text(model.jobTitle ?? "مصمم تجربة مستخدم"),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(Icons.calendar_today_outlined, size: 15.r),
              SizedBox(width: 8.w),
              Text(
                model.date != null
                    ? "تاريخ تقديم الطلب  :${model.date}"
                    : "تاريخ تقديم الطلب  :غير متاح",

                style: AppTextStyle.iBMP12w500MidnightBlue, // Color(0xff3D4966)
              ),
            ],
          ),
        ],
      ),
    );
  },
),
);
  }

  dropdownMenu(BuildContext context, TapDownDetails details) async {
    final position = details.globalPosition;
    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx - 50.h,
        position.dy + 5.h,
        position.dx,
        position.dy,
      ),
      items: [
        const PopupMenuItem(value: 'approve', child: Text('اعتماد')),
        const PopupMenuItem(
          value: 'approve_with_note',
          child: Text('اعتماد مع ملاحظة'),
        ),
        const PopupMenuItem(value: 'reject', child: Text('رفض')),
      ],
    );

    if (selected != null) {
      switch (selected) {
        case 'approve':
          ApproveCancelRequestModel approveCancelRequestModel =
              ApproveCancelRequestModel(
                id: model.id.toString() ?? "",
                value: 0,
                isApproved: true,
              );
          if (context.mounted) {
            context.read<ApproveCancelRequestCubit>().approveCancelRequest(
              approveCancelRequestModel,
            );
            context
                .read<GetReviewerFinancialRequestCubit>()
                .getReviewerFinancialRequest();
          }
          break;
        case 'approve_with_note':
          if (context.mounted) {
            _showNoteBottomSheet(context);
          }
          break;
        case 'reject':
          ApproveCancelRequestModel approveCancelRequestModel =
              ApproveCancelRequestModel(
                id: model.id.toString() ?? "",
                value: 0,
                isApproved: false,
              );
          if (context.mounted) {
            context.read<ApproveCancelRequestCubit>().approveCancelRequest(
              approveCancelRequestModel,
            );
            context
                .read<GetReviewerFinancialRequestCubit>()
                .getReviewerFinancialRequest();
          }
          break;
      }
    }
  }

  void _showNoteBottomSheet(BuildContext context) {
    final TextEditingController noteController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 16,
            left: 16,
            right: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // اغلق الـ BottomSheet
                },
                child: const Icon(Icons.close),
              ),
              SizedBox(height: 8.h),

              const Text(
                'ضع ملاحظاتك',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: noteController,
                maxLines: 5,
                maxLength: 500,
                decoration: const InputDecoration(
                  hintText: 'نص للملاحظات',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  String note = noteController.text;
                  // احفظ الملاحظة أو ابعتها للسيرفر

                  ApproveCancelRequestModel approveWithNote =
                      ApproveCancelRequestModel(
                        id: model.id.toString() ?? "",
                        value: 0,
                        isApproved: true,
                        // note: note, // أضف الملاحظة هنا
                      );

               // اغلق الـ BottomSheet
                },
                child: Container(
                  height: 40.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8).r,
                    border: Border.all(
                      color: context.color.primary,
                      width: 1.w,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'حفظ',
                      style: context.text.labelLarge!.copyWith(
                        color: context.color.primary,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
