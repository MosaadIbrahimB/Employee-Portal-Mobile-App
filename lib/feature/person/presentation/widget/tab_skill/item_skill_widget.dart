import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/core/utils/app_message.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/person/data/skill_model.dart';

class ItemSkillWidget extends StatelessWidget {
  const ItemSkillWidget({super.key,
    required this.skillModel});
  static  const IconData _moreVertRounded = IconData(
    0xf8dc,
    fontFamily: 'MaterialIcons',
  );

  final EducationAndSkillModel skillModel;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 16.0).r,
      child: Card(
        color:context.color.surface,
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 21.0, vertical: 8).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(skillModel.title??"", style:context.text.bodyLarge),// AppTextStyle.iBMP14w700),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      skillModel.isEducation==false?
                      SvgPicture.asset("assets/image/home/opening-times.svg"):
                      SvgPicture.asset("assets/image/person/doc_text.svg"),

                      SizedBox(width: 8.w),
                      Text(skillModel.date??"",
                          style: context.text.bodySmall),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  skillModel.degree!=null? Row(
                    children: [
                      skillModel.isEducation==false?
                      SvgPicture.asset("assets/image/person/award.svg"):
                      SvgPicture.asset("assets/image/person/doc_page.svg")
                      ,
                      SizedBox(width: 8.w),
                      Text(skillModel.degree??"",
                          style: context.text.bodySmall),
                    ],
                  ):
                  SizedBox.shrink(),
                ],
              ),
              GestureDetector(
                onTap: () {
                  AppMessage.  msgFunction(context);
                },
                child: Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                  color: context.color.secondary,//(0xFFF2F5F9),
                    borderRadius: BorderRadius.circular(8).r
                  ),
                  child: Icon(_moreVertRounded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
