import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

import '../../../../administrative_request/presentation/widget/item_request_widget.dart';
import '../custom_dropdown_button.dart';

class FoundRequestWidget extends StatelessWidget {
  const FoundRequestWidget({super.key, required this.response});
final  List<dynamic> response;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .75,
      child: Stack(
        children: [
      Container(
        margin: EdgeInsets.only(bottom: 50).r,
        child: ListView.builder(
          itemCount:response.length ,
          itemBuilder:(context, index) =>
            ItemRequestWidget(model: response[index]) ,

            ),
      ),

          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: SizedBox(
                width: 150.w,
                child: CustomDropdownButton()),
          ),

        ],
      ),
    );
  }
}
