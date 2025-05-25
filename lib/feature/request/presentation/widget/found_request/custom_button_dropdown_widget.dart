import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/request/data/dropdown_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonDropdownWidget extends StatelessWidget {
  static final List<String> options = [
    "طلب اداري",
    "طلب اذن",
    "طلب اضافي",
    "ساعات عمل شهري",
    "طلب سلفة",
    "طلب مالي",
    "طلب مأمورية"
  ];

  const CustomButtonDropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) async {
        final RenderBox overlay =
        Overlay
            .of(context)
            .context
            .findRenderObject() as RenderBox;

        final selectedItem = await showMenu<String>(
          context: context,
          position: RelativeRect.fromRect(
            details.globalPosition & const Size(40, 40),
            Offset.zero & overlay.size,
          ),
          items: options.map((option) {
            return PopupMenuItem<String>(
              value: option,
              height: 30, // <--- ده بيتحكم في ارتفاع العنصر الواحد في القايمة (المساحة البيضاء)
              child: Align( // <--- استخدم Align عشان تحط المحتوى في المكان اللي أنت عايزه
                alignment: Alignment.centerRight, // <--- النص هيكون على اليمين زي الصورة
                child: Text(
                  option,
                ),
              ),
            );
          }).toList(),
        );

        if (selectedItem != null) {
          if(context.mounted){
            context.read<DropdownCubit>().selectItem(selectedItem);
          }
        }
      },
      child: Container(
        width: 72.w,
        height: 72.h,
        decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(12).r,
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}
