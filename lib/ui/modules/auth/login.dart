import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onekgp_app/bloc/auth/auth.bloc.dart';
import 'package:onekgp_app/ui/components/login_text_field.dart';
import 'package:onekgp_app/ui/components/primary_button.dart';
import 'package:onekgp_app/ui/components/secondary_button.dart';
import 'package:onekgp_app/ui/utils/size_config.dart';
import 'package:onekgp_app/ui/utils/text_style.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController pass = TextEditingController();
    final TextEditingController confirmPass = TextEditingController();
    final PageController pageController = PageController();
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: SizeConfig.sh - SizeConfig.safeAreaVertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20.toHeight),
                  Image.asset(
                    "assets/app_logo.png",
                    width: SizeConfig.sw * 0.27,
                  ),
                  SizedBox(height: 20.toHeight),
                  Divider(
                    color: Color.fromARGB(255, 190, 189, 189),
                    thickness: .4.toHeight,
                    indent: 30,
                    endIndent: 30,
                  ),
                  SizedBox(height: 20.toHeight),
                  Flexible(
                    child: PageView(
                      controller: pageController,
                      children: [
                        Column(
                          children: [
                            Text("LOGIN", style: Theme.of(context).textTheme.headline6),
                            SizedBox(height: 20.toHeight),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: CustomLoginTextField(
                                hintTextL: "email",
                                ctrl: email,
                                validation: ((p0) => null),
                                type: TextInputType.emailAddress,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: CustomLoginTextField(
                                  hintTextL: "password",
                                  ctrl: pass,
                                  validation: ((p0) => null),
                                  obscureText: true,
                                  maxLength: 24),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                  child: SecondaryButton(
                                onPress: () {
                                  BlocProvider.of<AuthBloc>(context)
                                      .add(Login(email: email.text.trim(), password: pass.text.trim()));
                                },
                                text: "Login",
                              )),
                            ),
                            SizedBox(
                              height: 6.toHeight,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account ?",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 16.toFont,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 4.toWidth),
                                GestureDetector(
                                  onTap: (() {
                                    pageController.animateToPage(1,
                                        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
                                  }),
                                  child: Text("Sign Up", style: Theme.of(context).textTheme.bodyMedium),
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "SIGN UP",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            SizedBox(height: 20.toHeight),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: CustomLoginTextField(
                                hintTextL: "email",
                                ctrl: email,
                                validation: ((p0) => null),
                                type: TextInputType.emailAddress,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: CustomLoginTextField(
                                  hintTextL: "password",
                                  ctrl: pass,
                                  validation: ((p0) => null),
                                  obscureText: true,
                                  maxLength: 24),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: CustomLoginTextField(
                                  hintTextL: "confirm password",
                                  ctrl: pass,
                                  validation: ((p0) => null),
                                  obscureText: true,
                                  maxLength: 24),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                  child: SecondaryButton(
                                onPress: () {
                                  BlocProvider.of<AuthBloc>(context).add(SighUp(
                                      email: email.text.trim(),
                                      password: pass.text.trim(),
                                      name: email.text.split("@").first));
                                },
                                text: "Sign Up",
                              )),
                            ),
                            SizedBox(
                              height: 6.toHeight,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account ?",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 16.toFont,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 4.toWidth),
                                GestureDetector(
                                  onTap: (() {
                                    pageController.animateToPage(0,
                                        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
                                  }),
                                  child: Text(
                                    "Login",
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "onekgp",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.grey.shade300,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
