import 'package:employee_portal_mobile_app/core/component/custom_elevated_button_widget.dart';
import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/core/configure/route/app_route.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/login/presentation/widget/custom_email_input_widget.dart';
import 'package:employee_portal_mobile_app/feature/login/presentation/widget/header_widget.dart';
import 'package:employee_portal_mobile_app/core/utils/valid_utils.dart';
import 'package:employee_portal_mobile_app/feature/splash/presentation/widget/custom_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailControl.dispose();
    passwordControl.dispose();
    super.dispose();
  }

  // bool pass=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h, width: double.infinity),
                  HeaderWidget(),
                  SizedBox(height: 24.h),
                  Text("البريد الإلكتروني", style:
                  context.text.bodyLarge ,),//AppTextStyle.iBMP14w700),
                  SizedBox(height: 8.h),
                  CustomInputWidget(
                    emailControl: emailControl,
                    hintText: "example@gmail.com",
                    validator: (input) {
                      return ValidUtils.ifValidEmail(input);
                    },
                  ),
                  SizedBox(height: 20.h),
                  Text("كلمة المرور", style: context.text.bodyLarge),
                  SizedBox(height: 8.h),
                  CustomInputWidget(
                    validator: (input) {
                      return ValidUtils.ifValidPassword(input);
                    },
                    emailControl: passwordControl,
                    hintText: "كلمة المرور",
                    obscureText: true,
                    isPassWordInput: true,
                  ),
                  SizedBox(height: 100.h),

                  CustomButtonWidget(
                    isDisableIcon: true,
                    onTap: () {
                      // if (!formKey.currentState!.validate()) {
                      //   return;
                      // }
                      Navigator.pushReplacementNamed(context, AppRoute.layout);
                    },
                    title: "تسجيل الدخول",
                    colorTitle:context.color.secondaryContainer,// AppColor.titleButton,
                    color:context.color.secondaryFixedDim,// AppColor.buttonLogin,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
