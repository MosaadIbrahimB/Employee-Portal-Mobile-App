import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/loan/presentation/control/get_loan_type/get_loan_type_cubit.dart';
import 'package:employee_portal_mobile_app/feature/loan/presentation/control/post_loan/post_loan_cubit.dart';
import 'package:employee_portal_mobile_app/feature/loan/presentation/control/post_loan/post_loan_state.dart';
import '../../../../../core/service/dependency_injection/depend_inject.dart';
import '../../../../request/presentation/control/date_cubit/date_cubit.dart';
import '../../../../request/presentation/control/request/request_cubit.dart';
import '../../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../../../request/presentation/widget/add_document_button_widget.dart';
import '../../../../request/presentation/widget/app_bar_request_widget.dart';
import '../../../../request/presentation/widget/list_reviewer_widget.dart';
import '../../../../request/presentation/widget/notes_input_field.dart';
import '../../../../request/presentation/widget/request_date_widget.dart';
import '../../../../splash/presentation/widget/custom_button_widget.dart';
import '../../../../vacation/presentation/control/default_reviewer/default_reviewer_cubit.dart';
import '../../../../vacation/presentation/widget/vacation_request/reviewer_widget.dart';
import '../../../data/model/post/post_loan_request_model.dart';
import '../../../data/model/request_model.dart';
import '../../../data/model/valid/validate_loan_request_model.dart';
import '../../control/money_cubit/money_cubit.dart';
import '../../control/validate_loan/validate_loan_cubit.dart';
import '../../control/validate_loan/validate_loan_state.dart';
import '../end_date_installment_widget.dart';
import '../installment_widget.dart';
import '../total_installments_widget.dart';
import '../total_money_widget.dart';
import 'loan_type_request_dropdown_widget.dart';

class AddLoanWidget extends StatelessWidget {
  const AddLoanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => sl<GetLoanTypeCubit>()..getLoanType(),
            ),
            BlocProvider(create: (context) => sl<PostLoanCubit>()),
            BlocProvider(create: (context) => sl<ValidateLoanCubit>()),
            BlocProvider(create: (context) => MoneyCubit()),
            BlocProvider(create: (context) => DateCubit()),

          ],
          child: BlocListener<ValidateLoanCubit, ValidateLoanState>(
            listener: (context, state) {
              if (state.errorMessage != null) {
                context.showErrorDialog(state.errorMessage ?? "حدث خطأ ما");
              }

              if (state.response?.isValid == false) {
                context.showErrorDialog(
                  state.response?.message ?? "حدث خطأ ما",
                );
              } else if (state.response?.isValid == true) {
                context.read<PostLoanCubit>().postLoan(
                  postLoanRequestModel: getSelectedRequest(context),
                );
              }
            },
            child: BlocConsumer<PostLoanCubit, PostLoanState>(
              listener: (context, state) {
                if (state.errorMessage != null) {
                  context.showErrorDialog(state.errorMessage ?? "حدث خطأ ما");
                }

                if (state.response?.isValid == false) {
                  context.showErrorDialog(
                    state.response?.message ?? "حدث خطأ ما",
                  );
                } else if (state.response?.isValid == true) {
                  if (context.mounted) {
                    BlocProvider.of<RequestCubit>(context).changePage(0);
                    context.read<TabSwitcherCubit>().changeTab(0);

                    context.showSnackBar(
                      " الطلب قيد الاعتماد",
                      backgroundColor: Colors.green,
                    );
                    context.read<DateCubit>().setToDate(DateTime.now());
                    context.read<DateCubit>().setToDate(DateTime.now());
                    MoneyCubit.numberOfInstallmentsController.text='';
                    MoneyCubit.totalMoneyController.text='';
                  }
                }
              },

              builder: (context, state) {
                return Column(
                  children: [
                    SizedBox(height: 12.h),
                    AppBarRequestWidget(
                      icon: Icons.close,
                      title: "طلب سلفة ",
                      onTap: () {
                        context.read<TabSwitcherCubit>().changeTab(0);
                        context.read<DateCubit>().setToDate(DateTime.now());
                        context.read<DateCubit>().setToDate(DateTime.now());
                        MoneyCubit.numberOfInstallmentsController.text='';
                        MoneyCubit.totalMoneyController.text='';
                      },
                    ),
                    SizedBox(height: 20.h),
                    LoanTypeRequestDropdownWidget(),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                          child: InputDateDayWidget(
                            isRightIcon: true,
                            title: 'تاريخ السلفة',
                            onDateSelected: (date) {
                              context.read<DateCubit>().updateDate(date);
                            },
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: TotalMoneyWidget(
                            title: "اجمالى المبلغ",
                            controller: MoneyCubit.totalMoneyController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                          child: TotalInstallmentsWidget(
                            title: "عدد الاقساط",
                            controller:
                            MoneyCubit.numberOfInstallmentsController,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: InputDateDayWidget(
                            isRightIcon: true,
                            title: 'تاريخ البداية',
                            onDateSelected: (date) {
                              context.read<DateCubit>().setFromDate(date);
                              int number = int.tryParse(
                                  MoneyCubit
                                      .numberOfInstallmentsController.text ??
                                      '0') ??
                                  0;
                              context.read<DateCubit>().endInstallmentDate(number);

                            },
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(child: InstallmentWidget()),
                        SizedBox(width: 4.w),
                        Expanded(
                            child: EndDateInstallmentWidget()
                        ),

                      ],
                    ),
                    SizedBox(height: 16.h),
                    NotesInputField(
                      controller: PostLoanCubit.noteInputController,
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
                                .read<GetLoanTypeCubit>()
                                .state
                                .selectedRequestType
                                ?.id;

                        var fromData=context.read<DateCubit>().state.fromDate;
                        if (id == null) {
                          context.showErrorDialog("الرجاء اختيار نوع الطلب ");
                          return;
                        }

                        if (fromData== null) {
                          context.showErrorDialog("الرجاء اختيار تاريخ البداية ");
                          return;
                        }



                        context.read<ValidateLoanCubit>().validateLoan(
                          requestModel: validateLoanRequestModel(context),
                        );

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
      ),
    );
  }

  PostLoanRequestModel getSelectedRequest(BuildContext context) {
    return PostLoanRequestModel(
      date: context.read<DateCubit>().state.dateTime.toString(),
      value: int.tryParse(MoneyCubit.totalMoneyController.text) ?? 0,
      startDate: context.read<DateCubit>().state.fromDate.toString(),
      installments: int.parse(MoneyCubit.numberOfInstallmentsController.text??"0"),
      isRequest: true,
      notes: PostLoanCubit.noteInputController.text,
      loanTypeId:
      context.read<GetLoanTypeCubit>().state.selectedRequestType?.id ?? 0,
      request: RequestModel(
        reviewers:
        context.read<DefaultReviewerCubit>().state.listSelectedReviewers,
      ),
    );
  }

  ValidateLoanRequestModel validateLoanRequestModel(BuildContext context) {
    return ValidateLoanRequestModel(
      loanTypeId:
      context.read<GetLoanTypeCubit>().state.selectedRequestType?.id ?? 0,
      installments: int.parse(MoneyCubit.numberOfInstallmentsController.text??"0"),
      value: double.tryParse(MoneyCubit.totalMoneyController.text) ?? 0,
      startDate: context.read<DateCubit>().state.fromDate.toString(),
    );
  }
}