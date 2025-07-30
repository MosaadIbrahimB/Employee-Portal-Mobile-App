import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/control/home_cubit.dart';
import 'package:employee_portal_mobile_app/feature/notification/presentation/widget/item_notification_widget.dart';
import 'package:employee_portal_mobile_app/feature/notification/presentation/widget/notification_tab_of_app_bar_switcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../management_request/app_bar_management_request_widget.dart';


class TabEmployeeNotificationWidget extends StatelessWidget {
  const TabEmployeeNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme
        .of(context)
        .colorScheme;
    var textTheme = Theme
        .of(context)
        .textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBarManagementRequestWidget(
          title: "الاشعارات",
          icon: Icons.arrow_back,
          onTap: () {
            context.read<HomeCubit>().changeScreen(0);
          },
        ),
        SizedBox(height: 36.h),
        Center(child: NotificationTabOfAppBarSwitcher()),
        SizedBox(height: 12.h),
        ItemNotificationWidget(title: "جديد", backGround:colorTheme.onPrimaryFixed,),
        SizedBox(height: 8.h),
        ItemNotificationWidget(title: "تم قراتها سابقاً", backGround:colorTheme.surface,),
        ItemNotificationWidget( backGround:colorTheme.surface,),

      ],
    );
  }
}
