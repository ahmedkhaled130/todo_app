import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/auth/components/custom_text_form_field.dart';
import 'package:todo_app/auth/register/register_screen.dart';
import 'package:todo_app/core/routes.dart';
import 'package:todo_app/my_theme.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";
  var emailAddressController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage("assets/images/background.png"),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
              left: 150.w,
              top: 66.h,
              width: 60.w,
              height: 33.h,
              child: Text(
                "Login",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: MyTheme.whiteColor),
              )),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.36),
                          Text("Welcome back!",style: Theme.of(context).textTheme.bodyLarge,),
                          SizedBox(height: 10,),
                          CustomTextFormField(
                            label: "Email Address",
                            obscureText: false,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "please enter Email Address";
                              }
                              bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                              ).hasMatch(text);
                              if (!emailValid) {
                                return 'enter valid email';
                              }
                              return null;
                            },
                            controller: emailAddressController,
                          ),
                          SizedBox(height: 26),
                          CustomTextFormField(
                            label: "Password",
                            obscureText: true,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "please enter Password";
                              }
                              if (text.length < 6) {
                                return "Password must be more than 6 characters";
                              }
                              return null;
                            },
                            controller: passwordController,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(),
                                ),
                                backgroundColor: WidgetStatePropertyAll(
                                  Colors.blue,
                                ),
                              ),
                              onPressed: () {
                                login(context);
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextButton(
                              onPressed: () {

                                context.goNamed(RoutesName.register);
                              },
                              child: Text("Or Create My Account",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                    color: MyTheme.blackColor,
                                  )))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void login(BuildContext context) {
    if (formKey.currentState?.validate() == true) {
      context.goNamed(RoutesName.homescreen);

    }
  }
}
