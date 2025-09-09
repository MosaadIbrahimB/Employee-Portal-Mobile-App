import 'package:easy_localization/easy_localization.dart';
import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MissionRequestDateWidget extends StatefulWidget {
  const MissionRequestDateWidget({super.key, required this.title, this.fillColor, required this.onDateSelected, });
  final String title;
  final Color? fillColor;
  final void Function(DateTime) onDateSelected;
  @override
  State<MissionRequestDateWidget> createState() => MissionRequestDateWidgetState();
}
class MissionRequestDateWidgetState extends State<MissionRequestDateWidget> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,  style:context.text.bodyMedium),
        SizedBox(height: 8.h,),
        GestureDetector(
          onTap: _showDatePickerDialog,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal:4).r,
            decoration: BoxDecoration(
              color: widget.fillColor,
              border: Border.all(color: context.color.outline),
              borderRadius: BorderRadius.circular(8),
            ),
            child:   Row(
              children: [
                Icon(Icons.calendar_today_outlined, size: 16),
                SizedBox(width: 8.w,),
                Text(
                  _formatFullDate(selectedDate),
                  style: context.text.titleMedium!.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),

        ),
      ],
    );
  }



  String _formatFullDate(DateTime date) {
    // تنسيق التاريخ كامل بالعربية، مثلاً: الإثنين، 1 يونيو 2025
    return DateFormat('EEEE، d MMMM yyyy', 'ar').format(date);
  }

  void _showDatePickerDialog() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2075),
      locale: const Locale('ar'),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColor, // لون رأس التاريخ
              onPrimary: Colors.white, // لون نص الرأس
              onSurface: Colors.black, // لون نص الأيام
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor, // لون أزرار النص
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
      widget.onDateSelected(pickedDate);
    }
  }

  // void _showDatePickerDialog() async {
  //   final DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2020),
  //     lastDate: DateTime(2075),
  //     locale: const Locale('ar'),
  //     builder: (context, child) {
  //       return Theme(
  //         data: Theme.of(context).copyWith(
  //           colorScheme: ColorScheme.light(
  //             primary: Theme.of(context).primaryColor,
  //             onPrimary: Colors.white,
  //             onSurface: Colors.black,
  //           ),
  //           textButtonTheme: TextButtonThemeData(
  //             style: TextButton.styleFrom(
  //               foregroundColor: Theme.of(context).primaryColor,
  //             ),
  //           ),
  //         ),
  //         child: child!,
  //       );
  //     },
  //   );
  //
  //   if (pickedDate != null) {
  //     // بعد اختيار التاريخ، نفتح الـ TimePicker
  //     final TimeOfDay? pickedTime = await showTimePicker(
  //       context: context,
  //       initialTime: TimeOfDay.fromDateTime(selectedDate),
  //     );
  //
  //     if (pickedTime != null) {
  //       final DateTime finalDateTime = DateTime(
  //         pickedDate.year,
  //         pickedDate.month,
  //         pickedDate.day,
  //         pickedTime.hour,
  //         pickedTime.minute,
  //       );
  //
  //       setState(() {
  //         selectedDate = finalDateTime;
  //       });
  //
  //       widget.onDateSelected(finalDateTime);
  //     }
  //   }
  // }


}