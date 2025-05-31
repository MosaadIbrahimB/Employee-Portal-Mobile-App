import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class InputDataWidget extends StatelessWidget {
  const InputDataWidget({
    super.key,
    required this.title,
    required this.hint,
    required this.controller, this.suffixIcon,
  });

  final String title;
  final String hint;
  final TextEditingController controller;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.text.bodyMedium ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          style:  context.text.titleMedium ,
          decoration: InputDecoration(
            suffixIcon: suffixIcon??Icon(Icons.keyboard_arrow_down),

            hintText: hint,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: context.color.outline),
              borderRadius: BorderRadius.circular(12).r,
            ),
            contentPadding:
            EdgeInsets.symmetric(horizontal: 12, vertical: 14).r,
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
