import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/salary/widget/detail_salary_body_widget.dart';

class DetailSalaryScreen extends StatelessWidget {
  const DetailSalaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("التفاصيل", style: AppTextStyle.iBMP24w600),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.all(12).r,
            color: Color(0xffF2F5F9),
            child: Icon(Icons.close),
          ),
        ),
      ),
      body: SingleChildScrollView(child: DetailSalaryBodyWidget()),
    );
  }
}

