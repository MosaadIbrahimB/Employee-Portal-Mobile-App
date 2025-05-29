import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/control/home_cubit.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/home_body_widget.dart';
import 'package:employee_portal_mobile_app/feature/notification/control/tab_notification_cubit/tab_notification_cubit.dart';
import 'package:employee_portal_mobile_app/feature/notification/presentation/screen/notification_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<Widget> _body = [
    HomeBodyWidget(),
    NotificationScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
        BlocProvider(
        create: (context) => HomeCubit(),),
        BlocProvider(
        create: (context) => TabNotificationCubit(),),


    ], child:  SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 25).r,
              child: BlocBuilder<HomeCubit,int>(builder: (context, state) => _body[state],)
          ),
        ),
      ),
    );
  }
}


