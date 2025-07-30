// BlocBuilder<GetFinancialRequestTypeCubit, GetFinancialRequestTypeState>(
//   builder: (context, state) {
//     if (state.isLoading == true) {
//       return const Center(child: Text('جارى التحميل ...'));
//     }
//     if (state.errorMessage != null) {
//       return Text(state.errorMessage!);
//     }
//
//     return DropdownButtonHideUnderline(
//       child: DropdownButton2<FinancialRequestTypeModel>(
//         isExpanded: true,
//         value: state.selectedRequestType,
//         hint: Text(
//           'طلب جديد',
//           style: context.text.bodyLarge!.copyWith(
//             color: context.color.surface,
//           ),
//         ),
//
//         items:
//         state.response!.map((request) {
//           return DropdownMenuItem<
//               FinancialRequestTypeModel
//           >(
//             value: request,
//             child: Text(request.name ?? " لا يوجد نوع طلبات للمستخدم"),
//
//           );
//         }).toList(),
//         onChanged: (value) {
//           if (value != null) {
//             context
//                 .read<GetFinancialRequestTypeCubit>()
//                 .selectedRequestType(value);
//           }
//         },
//         buttonStyleData: ButtonStyleData(
//           height: 50.h,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12).r,
//             color: context.color.primary,
//           ),
//           padding: EdgeInsets.symmetric(horizontal: 16.w),
//         ),
//         iconStyleData: IconStyleData(
//           icon: Icon(
//             Icons.keyboard_arrow_down_rounded,
//             color: context.color.surface,
//           ),
//         ),
//         dropdownStyleData: DropdownStyleData(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12).r,
//           ),
//         ),
//       ),
//     );
//   },
// ),
