import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/control/home_cubit.dart';
import 'package:employee_portal_mobile_app/feature/notification/presentation/widget/notification_tab_of_app_bar_switcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../request/presentation/widget/request_type/management_request/app_bar_management_request_widget.dart';

class TabAllNotificationWidget extends StatelessWidget {
  const TabAllNotificationWidget({super.key});

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
        SizedBox(height: 12.h),
        AppBarManagementRequestWidget(
          title: "الاشعارات",
          icon: Icons.arrow_back,
          onTap: () {
            context.read<HomeCubit>().changeScreen(0);
          },
        ),
        SizedBox(height: 12.h),
        NotificationTabOfAppBarSwitcher(),
        SizedBox(height: 12.h),
        ItemNotificationWidget(title: "جديد", backGround:colorTheme.onPrimaryFixed,),
        SizedBox(height: 8.h),
        ItemNotificationWidget(title: "تم قراتها سابقاً", backGround:colorTheme.onSecondaryFixed,),
        ItemNotificationWidget( backGround:colorTheme.onSecondaryFixed,),

      ],
    );
  }
}

class ItemNotificationWidget extends StatelessWidget {
  const ItemNotificationWidget({super.key, this.title, this.backGround});

  final String?title;
  final Color?backGround;

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


        title!=null?
        Column(children: [Text(
          title??"",
          style: Theme
              .of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
          SizedBox(height: 12.h),],):SizedBox.shrink(),


        Container(
          margin: EdgeInsets.only(
            bottom: 12.h,
          ).r,
          padding: EdgeInsets
              .all(12)
              .r,
          width: double.infinity,
          decoration: BoxDecoration(
            color: backGround ?? colorTheme.onPrimaryFixed,
            borderRadius: BorderRadius
                .circular(12)
                .r,
            border: Border.all(color: colorTheme.outline),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 6.h),
                  Text(
                    "برجاء تسليم وثيقة التآمين الطبي",
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorTheme.onPrimary,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "هنا يتم كتابة وصف عن الاشعار ",
                    style: textTheme.bodyLarge,
                  ),
                  SizedBox(height: 6.h),
                  Text("20 May 2024 ", style: textTheme.labelSmall),
                ],
              ),

              Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ],
    );
  }
}
