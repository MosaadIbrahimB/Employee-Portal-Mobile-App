import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class AddDocumentButtonWidget extends StatelessWidget {
  const AddDocumentButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return    GestureDetector(
      onTap: (){},

      child: Container(
        height: 44.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10).r,
            border: Border.all(
              color:AppColor.blue,
            )
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: 14.w,height: 14.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColor.blue
                      )
                  ),
                  child: Center(
                      child: Icon(
                        Icons.add,color: AppColor.blue,size: 10,
                      ))),

              SizedBox(width: 8.w),
              Text(
                "اضافة وثائق",
                style: AppTextStyle.iBMP16w700Black.copyWith(
                    color: AppColor.blue),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
