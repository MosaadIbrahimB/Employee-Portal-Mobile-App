import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class AppMessage {
 static msgFunction(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("قريبا سيتم اضافة هذه الميزة"),
        duration: Duration(seconds: 2),
      ),
    );
  }
}