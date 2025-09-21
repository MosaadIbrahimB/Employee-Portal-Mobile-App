import 'package:easy_localization/easy_localization.dart';
import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../control/date_cubit/date_cubit.dart';

class RequestDateWidget extends StatelessWidget {
  const RequestDateWidget({super.key, this.isRightIcon=false});
final bool? isRightIcon  ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputDateDayWidget(
          isRightIcon: isRightIcon,
          title: " تاريخ الطلب",
          onDateSelected: (date) {
            context.read<DateCubit>().updateDate(date);
          },
        ),
      ],
    );
  }
}

class InputDateDayWidget extends StatefulWidget {
  const InputDateDayWidget({
    super.key,
    required this.title,
    this.fillColor,
    this.isRightIcon=false,
    required this.onDateSelected,
  });

  final String title;
  final Color? fillColor;
  final bool? isRightIcon ;
  final void Function(DateTime) onDateSelected;

  @override
  State<InputDateDayWidget> createState() => _InputDateDayWidgetState();
}

class _InputDateDayWidgetState extends State<InputDateDayWidget> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: context.text.bodyMedium),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: _showDatePickerDialog,
          child: Container(
              height: 52.h,
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12).r,
            decoration: BoxDecoration(
              color: widget.fillColor,
              // color: Colors.red,

              border: Border.all(color: context.color.outline),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                if (widget.isRightIcon == true) ...[
                  Icon(Icons.calendar_today_outlined, size: 20,
                  color: context.color.shadow),
                  SizedBox(width: 8.w),
                ],
                Text(
                  _formatFullDate(selectedDate),
                  style: context.text.titleMedium,
                ),
              if(widget.isRightIcon != true) ...[
                Spacer(),
                Icon(Icons.calendar_today_outlined, size: 20,
                color: context.color.shadow),
              ],
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
                foregroundColor:
                    Theme.of(context).primaryColor, // لون أزرار النص
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
}
