import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/core/extensions/app_extensions.dart';
import '../../../../core/const/assets_path.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/my_textfield.dart';
import '../../../../widgets/password_field/password_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController(text: "");
    passwordController = TextEditingController(text: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppColor color =
        Theme.of(context).extension<AppColor>() ?? AppColor.light;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: color.background1,
      appBar: null,
      body: Stack(
        children: [
          Positioned(
            left: -30,
            top: -20,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: color.primaryColor,
            ),
          ),
          Positioned(
            right: -50,
            top: 200,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: color.primaryColor,
            ),
          ),
          Positioned(
            left: -50,
            bottom: 80,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: color.primaryColor,
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Foodit",
                    style: GoogleFonts.berkshireSwash(
                        textStyle: TextStyle(
                      color: color.primaryColor,
                      fontSize: 48,
                    )),
                  ).pb(24),
                  Text(
                    "Welcome to FoodIt",
                    style: textTheme.headlineLarge,
                  ).pb(8),
                  Text(
                    "Order your food with ease",
                    style: textTheme.bodyMedium
                        ?.apply(color: color.greySmoke, fontWeightDelta: 300),
                  ).pb(24),
                  MyTextField(
                    textController: emailController,
                    validator: (value) {
                      if (value == null || value.trim() == "") {
                        return "Please enter your email";
                      }
                      if (!value.isEmail()) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
                    label: "Email",
                    prefixIcon: const Icon(Icons.person_outline),
                  ).pb(20),
                  PasswordField(
                    textEditingController: passwordController,
                  ).pb(16),
                  AppButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              var data = {
                                "email": emailController.text,
                                "password": passwordController.text
                              };

                              print(data);
                            }
                          },
                          label: "Login")
                      .pb(8),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Forgot your password?",
                      style: textTheme.bodyMedium?.apply(
                        color: color.primaryColor,
                        fontWeightDelta: 400,
                      ),
                    ),
                  ).pb(24),
                  GestureDetector(
                    onTap: () {},
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account? ",
                            style: textTheme.bodyMedium?.apply(
                              fontWeightDelta: 400,
                            ),
                          ),
                          TextSpan(
                            text: "Register now",
                            style: textTheme.bodyMedium?.apply(
                              fontWeightDelta: 400,
                              color: color.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ).pb(24),
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(),
                      ),
                      Text(
                        "OR",
                        style: textTheme.bodyLarge?.apply(
                            color: color.greySmoke, fontWeightDelta: 300),
                      ).ph(8),
                      const Expanded(child: Divider())
                    ],
                  ).pb(8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: color.whiteWater, elevation: 0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetPaths.googleLogo,
                            height: 24,
                          ).pr(16),
                          Text(
                            "Sign in with Google",
                            style: textTheme.labelMedium,
                          )
                        ],
                      ),
                    ),
                  ).pb(24),
                ],
              ).ph(24),
            ),
          ),
        ],
      ),
    );
  }
}
