import '../../../../../core/service/dependency_injection/depend_inject.dart';
import '../../../../../core/utils/import_file.dart';
import '../../../../vacation/presentation/control/approve_cancel_request/approve_cancel_request_cubit.dart';
import '../../../../vacation/presentation/control/approve_cancel_request/approve_cancel_request_state.dart';
import '../../../data/model/response_mission_model.dart';

class ItemOfTabCreditsRequestWidget extends StatelessWidget {
  const ItemOfTabCreditsRequestWidget({super.key, required this.model});

  final ResponseMissionModel model;

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
                model.destination ?? "requestTypeName",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Spacer(),
              GestureDetector(
                onTapDown: (details) {
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
              Text(model.destination ?? "اسم الموظف  : محمد فتحى محمد غانم"),
              Text(model.destination ?? "مصمم تجربة مستخدم"),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(Icons.calendar_today_outlined, size: 15.r),
              SizedBox(width: 8.w),
              Text(
                model.from != null
                    ? "تاريخ تقديم الطلب  :${model.from}"
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


}
