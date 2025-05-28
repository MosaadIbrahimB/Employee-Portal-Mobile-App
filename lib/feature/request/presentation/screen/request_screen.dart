import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/request/control/dropdown/dropdown_cubit.dart';
import 'package:employee_portal_mobile_app/feature/request/control/request/request_cubit.dart';
import 'package:employee_portal_mobile_app/feature/request/control/tab_switcher/tab_switcher_cubit.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/add_request/add_request_type_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  static final List<Widget> screen = [
    RequestScreenBody(),
    AddRequestTypeWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DropdownCubit>(create: (context) => DropdownCubit()),
        BlocProvider<RequestCubit>(create: (context) => RequestCubit()),
        BlocProvider<TabSwitcherCubit>(create: (context) => TabSwitcherCubit()),
      ],
      child: BlocBuilder<RequestCubit,int>(
        builder: (context,state) {
          return screen[state];
        }
      ),
    );
  }
}

