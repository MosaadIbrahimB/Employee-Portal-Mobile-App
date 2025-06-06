import 'dart:io';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:file_picker/file_picker.dart';

class CustomImagePickWidget extends StatefulWidget {
  const CustomImagePickWidget({super.key});

  @override
  State<CustomImagePickWidget> createState() => _CustomImagePickWidgetState();
}

class _CustomImagePickWidgetState extends State<CustomImagePickWidget> {
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: GestureDetector(
        onTap: _pickImage,
        child: Column(
          children: [
            Container(
              width: 140.w,
              height: 140.h,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 3,
                    color: context.color.primaryContainer.withOpacity(.2)),
                borderRadius: BorderRadius.circular(12).r,
                color:context.color.primary.withOpacity(0.20)
              ),
              child:
              _imageFile == null
                  ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 27.h),

                    SizedBox(
                      width: 48.w,
                      height: 48.h,
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/image/person/upload.svg",
                        ),
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Text("ارفع صورة شخصية", style:context.text.bodyMedium,)// AppTextStyle.iBMP14w500,),
                    ,SizedBox(height: 14.h),

                  ],
                ),
              )
                  : Image.file(_imageFile!, fit: BoxFit.fill),

            ),
          ],
        ),
      ),
    );
  }
  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "اختر مصدر الصورة",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text("اختيار من الملفات"),
                onTap: () async {
                  Navigator.pop(context);
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(type: FileType.image);
                  if (result != null && result.files.single.path != null) {
                    setState(() {
                      _imageFile = File(result.files.single.path!);
                    });
                  }
                },
              ),
              if (_imageFile != null)
                ListTile(
                  leading: Icon(Icons.delete, color: Colors.red),
                  title: Text(
                    "حذف الصورة",
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _imageFile = null;
                    });
                  },
                ),
            ],
          ),
        );
      },
    );
  }

}
