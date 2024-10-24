import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/auth/components/custom_text_form_field.dart';
import 'package:todo_app/auth/login/login_screen.dart';
import 'package:todo_app/core/routes.dart';
import 'package:todo_app/my_theme.dart';

class RegisterScreen extends StatelessWidget {
  var userNameController = TextEditingController();
  var emailAddressController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
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
              left: 114.w,
              top: 66.h,

              child: Text(
                "Create Account",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: MyTheme.whiteColor),
              )),
          Form(
            key: formKey,
            child: Container(
              padding: EdgeInsets.only(top: 30, left: 15, right: 15),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3),
                          CustomTextFormField(
                            label: "User Name",
                            obscureText: false,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "please enter Username";
                              }
                              return null;
                            },
                            controller: userNameController,
                          ),
                          SizedBox(height: 26),
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
                          SizedBox(height: 26),
                          CustomTextFormField(
                            label: "Confirmation Password",
                            obscureText: true,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "please enter Confirmation Password";
                              }
                              if (text != passwordController.text) {
                                return "Password is not match";
                              }
                              return null;
                            },
                            controller: rePasswordController,
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
                                register();
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                // Navigator.pushAndRemoveUntil(
                                //     context,
                                //     MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
                                //     ModalRoute.withName('/'));
                                   context.goNamed(RoutesName.login);  },
                              child: Text("Already have account",
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
          ),
        ],
      ),
    );
  }

  void register() {
    if (formKey.currentState?.validate() == true) {}
  }
}
