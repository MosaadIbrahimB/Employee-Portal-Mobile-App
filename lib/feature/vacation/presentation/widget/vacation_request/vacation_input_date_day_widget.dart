import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class VacationInputDateDayWidget extends StatefulWidget {
  const VacationInputDateDayWidget({super.key, required this.title, this.fillColor, required this.onDateSelected, });
  final String title;
  final Color? fillColor;
  final void Function(DateTime) onDateSelected;
  @override
  State<VacationInputDateDayWidget> createState() => _VacationInputDateDayWidgetState();
}

class _VacationInputDateDayWidgetState extends State<VacationInputDateDayWidget> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,  style:textTheme.bodyMedium),
        SizedBox(height: 8.h,),
        GestureDetector(
          onTap: _pickDate,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12).r,
            decoration: BoxDecoration(
              color: widget.fillColor,
              border: Border.all(color: colorTheme.outline),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [

                Text(
                  " ${selectedDate.year}",
                  style:
                  textTheme.titleMedium                  ,
                ),
                Text(
                  " ${_monthName(selectedDate.month)} ",
                  style:
                  textTheme.titleMedium                  ,
                ),
                Text(
                  "${selectedDate.day}  ",
                  style:
                  textTheme.titleMedium                  ,
                ),

                Spacer(),
                Icon(Icons.calendar_today_outlined,size: 20.r,),

              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2025),
      lastDate: DateTime(2200),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      widget.onDateSelected(picked);
    }
  }

  String _monthName(int month) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return months[month - 1];
  }
}
