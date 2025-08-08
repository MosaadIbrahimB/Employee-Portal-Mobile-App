import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/control/admin_request_type/get_admin_request_type_cubit.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/control/financial_request_type/get_financial_request_type_cubit.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/control/financial_request_type/get_financial_request_type_state.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/control/post_administrative_request/post_administrative_request_state.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/add_document_button_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/notes_input_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/service/dependency_injection/depend_inject.dart';
import '../../request/data/model/request_post_administrative_request_model.dart';
import '../../request/presentation/control/date_cubit/date_cubit.dart';
import '../../request/presentation/control/get_reviewer_administrative_request/get_reviewer__administrative_request_cubit.dart';
import '../../request/presentation/control/post_administrative_request/post_administrative_request_cubit.dart';
import '../../request/presentation/control/request/request_cubit.dart';
import '../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../request/presentation/widget/list_reviewer_widget.dart';
import '../../request/presentation/widget/request_date_widget.dart';
import '../../splash/presentation/widget/custom_button_widget.dart';
import '../../vacation/presentation/control/default_reviewer/default_reviewer_cubit.dart';
import '../../vacation/presentation/control/default_reviewer/default_reviewer_state.dart';
import '../../vacation/presentation/widget/vacation_request/reviewer_widget.dart';
import '../app_bar_financial_request_widget.dart';
import 'financial_type_request_dropdown_widget.dart';

//طلب ادارى شاشة اضافة

class AddFinancialRequestWidget extends StatelessWidget {
  const AddFinancialRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
        child: BlocProvider(
          create: (context) =>
          sl<GetFinancialRequestTypeCubit>()
            ..getFinancialRequest(),
          child: BlocBuilder<
              PostAdministrativeFinancialRequestCubit,
              PostAdministrativeFinancialRequestState
          >(
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(height: 12.h),
                  AppBarFinancialRequestWidget(
                    icon: Icons.close,
                    title: "طلب مالي ",
                    onTap: () {
                      context.read<TabSwitcherCubit>().changeTab(0);
                    },
                  ),
                  SizedBox(height: 20.h),
                  FinancialTypeRequestDropdownWidget(),
                  SizedBox(height: 16.h),
                  RequestDateWidget(),
                  SizedBox(height: 16.h),
                  SizedBox(height: 16.h),
                  NotesInputField(
                    controller:
                    PostAdministrativeFinancialRequestCubit
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
                              .read<GetFinancialRequestTypeCubit>()
                              .state
                              .selectedRequestType
                              ?.id;
                      if (id == null) {
                        context.showErrorDialog(
                          "الرجاء اختيار نوع الطلب المالي",
                        );
                        return;
                      }


                      context
                          .read<PostAdministrativeFinancialRequestCubit>()
                          .postAdministrativeFinancialRequest(
                        requestPostAdministrativeFinancialRequestModel: getSelectedRequest(
                            context),
                      )
                          .then((value) {
                        if (context.mounted) {
                          BlocProvider.of<RequestCubit>(context).changePage(0);



                          context.showSnackBar(" الطلب قيد الاعتماد",
                            backgroundColor: Colors.green,
                          );

                          print("id $id");
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

  RequestPostAdministrativeFinancialRequestModel getSelectedRequest(
      BuildContext context) {
    return RequestPostAdministrativeFinancialRequestModel(
      requestType:
      context
          .read<GetFinancialRequestTypeCubit>()
          .state
          .selectedRequestType
          ?.id ??
          0,
      date: context
          .read<DateCubit>()
          .state
          .dateTime
          .toString(),
      notes:
      PostAdministrativeFinancialRequestCubit.noteInputController.text,
      reviewers:
      context
          .read<DefaultReviewerCubit>()
          .state
          .listSelectedReviewers,
    );
  }
}
