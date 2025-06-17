import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
class CustomDecoratorContainerWidget extends StatelessWidget {
  const CustomDecoratorContainerWidget({
    super.key,
    required this.child,
    this.height,
  });

  final Widget child;
  final double ?height ;

  @override
  Widget build(BuildContext context) {
    return    Container(
      height:height?? 62.h,
      alignment: AlignmentDirectional.centerStart,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12).r,
      decoration: BoxDecoration(
        border: Border.all(color: context.color.outline),
        borderRadius: BorderRadius.circular(8).r,
        color: context.color.onPrimaryContainer,
      ),
      child: child,
    );
  }
}