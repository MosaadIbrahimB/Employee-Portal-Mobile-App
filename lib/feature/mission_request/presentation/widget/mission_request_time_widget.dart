import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';
class MissionRequestTimeWidget extends StatefulWidget {
  const MissionRequestTimeWidget({
    super.key,
     this.title,
    required this.onTimeSelected,
  });

  final String ?title;
  final void Function(TimeOfDay) onTimeSelected;

  @override
  State<MissionRequestTimeWidget> createState() =>
      _MissionRequestTimeWidgetState();
}

class _MissionRequestTimeWidgetState extends State<MissionRequestTimeWidget> {
  TimeOfDay? selectedTime;

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: context.color.primary, // لون المؤشر والأزرار
              onSurface: context.color.onSurface, // لون النصوص
            ),
            timePickerTheme: TimePickerThemeData(
              dayPeriodTextColor: Colors.black,   // لون النص (ص/م)
              dayPeriodColor: WidgetStateColor.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return context.color.primary; // الخلفية عند التحديد
                }
                return Colors.grey.shade300; // الخلفية العادية
              }),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() => selectedTime = picked);
      widget.onTimeSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: _pickTime,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(widget.title??"اختر الوقت", style:context.text.bodyMedium),
          SizedBox(height: 8.h),

          Container(
            padding:
            EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 12,
            ).r,
            decoration: BoxDecoration(
              border: Border.all(
                color: context.color.outline,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.access_time_outlined,
                  size: 15,
                  color: AppColor.midnightBlue,
                ),
                SizedBox(width: 8.w),
                Text(selectedTime == null
                    ? "اختر الوقت"
                    : selectedTime!.format(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
