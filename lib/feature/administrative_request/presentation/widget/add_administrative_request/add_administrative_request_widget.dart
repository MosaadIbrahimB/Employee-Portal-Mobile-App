import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/presentation/control/post_administrative_request/post_administrative_request_state.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/presentation/widget/app_bar_management_request_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/add_document_button_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/notes_input_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/service/dependency_injection/depend_inject.dart';
import '../../../../request/presentation/control/date_cubit/date_cubit.dart';
import '../../../../request/presentation/control/request/request_cubit.dart';
import '../../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../../../request/presentation/widget/list_reviewer_widget.dart';
import '../../../../request/presentation/widget/request_date_widget.dart';
import '../../../../splash/presentation/widget/custom_button_widget.dart';
import '../../../../vacation/presentation/control/default_reviewer/default_reviewer_cubit.dart';
import '../../../../vacation/presentation/widget/vacation_request/reviewer_widget.dart';
import '../../../data/model/request_post_administrative_request_model.dart';
import '../../control/administrative_request_type/get_administrative_request_type_cubit.dart';
import '../../control/post_administrative_request/post_administrative_request_cubit.dart';
import 'administrative_type_request_dropdown_widget.dart';

//طلب ادارى شاشة اضافة

class AddAdministrativeRequestWidget extends StatelessWidget {
  const AddAdministrativeRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
        child: BlocProvider(
          create:
              (context) => sl<GetAdministrativeRequestTypeCubit>()..getAdministrativeRequest(),
          child: BlocBuilder<
            PostAdministrativeRequestCubit,
            PostAdministrativeRequestState
          >(
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(height: 12.h),
                  AppBarAdministrativeRequestWidget(
                    icon: Icons.close,
                    title: "اضافة طلب ادارى",
                    onTap: () {
                      context.read<TabSwitcherCubit>().changeTab(0);
                    },
                  ),
                  SizedBox(height: 20.h),
                  AdministrativeTypeRequestDropdownWidget(),
                  SizedBox(height: 16.h),
                  RequestDateWidget(),
                  SizedBox(height: 16.h),
                  SizedBox(height: 16.h),
                  NotesInputField(
                    controller:
                        PostAdministrativeRequestCubit
                            .noteInputController,
                  ),
                  SizedBox(height: 44.h),
                  AddDocumentButtonWidget(),
                  SizedBox(height: 16.h),
                  ReviewerWidget(),
                  SizedBox(height: 16.h),
                  ListReviewerWidget(),
                  SizedBox(height: 16.h),

                  CustomButtonWidget(
                    onTap: () {
                      int? id =
                          context
                              .read<GetAdministrativeRequestTypeCubit>()
                              .state
                              .selectedRequestType
                              ?.id;

                      if (id == null) {
                        context.showErrorDialog("الرجاء اختيار نوع الطلب");
                        return;
                      }

                      context
                          .read<PostAdministrativeRequestCubit>()
                          .postAdministrativeRequest(requestPostAdministrativeRequestModel:  getModel(context),


                          )
                          .then((value) {
                            if (context.mounted) {
                              BlocProvider.of<RequestCubit>(
                                context,
                              ).changePage(0);
                              context.read<TabSwitcherCubit>().changeTab(0);

                              context.showSnackBar(
                                " الطلب قيد الاعتماد",
                                backgroundColor: Colors.green,
                              );
                            }
                          });
                    },
                    title: "قدم الطلب",
                  ),
                  SizedBox(height: 30.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  RequestPostAdministrativeRequestModel getModel(
    BuildContext context,
  ) {
    return RequestPostAdministrativeRequestModel(
      requestType:
          context
              .read<GetAdministrativeRequestTypeCubit>()
              .state
              .selectedRequestType
              ?.id ??
          0,
      date: context.read<DateCubit>().state.dateTime.toString(),
      notes: PostAdministrativeRequestCubit.noteInputController.text,
      reviewers:
          context.read<DefaultReviewerCubit>().state.listSelectedReviewers,
    );
  }
}
