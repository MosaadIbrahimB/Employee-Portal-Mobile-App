import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/request/control/request/request_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarManagementRequestWidget extends StatelessWidget {
  const AppBarManagementRequestWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return    Row(
      children: [
        GestureDetector(
          onTap: () {
            BlocProvider.of<RequestCubit>(context).changePage(0);
          },
          child: Container(
            padding: EdgeInsets.all(8).r,
            color: Color(0xffF2F5F9),
            child: Icon(Icons.close),
          ),
        ),
        SizedBox(width: 12.w),
        Text(title, style: Theme.of(context).textTheme.headlineLarge),
      ],
    );

  }
}
