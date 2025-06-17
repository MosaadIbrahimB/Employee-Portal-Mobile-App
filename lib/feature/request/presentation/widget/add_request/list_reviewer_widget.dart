import 'package:cached_network_image/cached_network_image.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/default_reviewer/default_reviewer_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/default_reviewer/default_reviewer_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/default_reviewer/default_reviewer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListReviewerWidget extends StatelessWidget {
  const ListReviewerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.13,
      child: BlocBuilder<DefaultReviewerCubit, DefaultReviewerState>(
        builder: (context, state) {
          final defaultReviewerState =
              context.read<DefaultReviewerCubit>().state;

          List<DefaultReviewerModel> list =
              defaultReviewerState.listSelectedReviewers;
          if (defaultReviewerState.isLoading) {
            return Center(child: Center(child: CircularProgressIndicator()));
          }

          if (defaultReviewerState.errorMessage != null) {
            return Center(child: Text(defaultReviewerState.errorMessage!));
          }
          if (defaultReviewerState.reviewers.isEmpty) {
            return Center(child: Text("لا توجد مؤاجعين متاحة"));
          }

          return ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: list.length,
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              final reviewer = list[index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                textDirection: TextDirection.rtl,
                children: [
                  SizedBox(
                    width: 48.w,
                    height: 48.h,
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://mohrapi.azurewebsites.net/Content/Images/employeeIcon.png",
                      imageBuilder:
                          (context, imageProvider) => CircleAvatar(
                            radius: 24.r,
                            backgroundImage: imageProvider,
                          ),
                      placeholder:
                          (context, url) =>
                              Center(child: Text("جارى تحميل الصورة")),
                      errorWidget:
                          (context, url, error) => CircleAvatar(
                            radius: 24.r,
                            backgroundImage: AssetImage(
                              'assets/image/request/user.png',
                            ),
                          ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reviewer.id.toString() ?? "645533",
                        style: context.text.titleSmall,
                      ),
                      Text(
                        reviewer.name ?? "الاسم",
                        style: context.text.titleLarge,
                      ),
                    ],
                  ),
                  SizedBox(width: 12.w),

                  GestureDetector(
                    onTap: (){
                      context.read<DefaultReviewerCubit>().removeReviewer(reviewer);
                    },
                    child: Icon(
                      Icons.close,
                      color: context.color.onSurface.withOpacity(0.5),
                      size: 25.r,
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
