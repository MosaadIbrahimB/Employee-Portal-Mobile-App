import 'package:employee_portal_mobile_app/feature/notification/control/tab_notification_cubit/tab_notification_cubit.dart';
import 'package:employee_portal_mobile_app/feature/notification/presentation/widget/tab_all_notification_widget/tab_all_notification_widget.dart';
import 'package:employee_portal_mobile_app/feature/notification/presentation/widget/tab_employee_notification_widget/TabEmployeeNotificationWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  static final List<Widget> listBody = [
    TabAllNotificationWidget(),
    TabEmployeeNotificationWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabNotificationCubit, int>(
      builder: (context, state) => listBody[state],
    );
  }
}
