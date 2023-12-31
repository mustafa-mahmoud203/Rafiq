import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/components/components.dart';
import 'package:rafiq/data/models/forget_model.dart';
import 'package:rafiq/logic/cubit/forget_cubit/forget_cubit.dart';
import 'package:rafiq/views/forget_password/screens/second_forget_password.dart';
import 'package:rafiq/views/login/screens/login_screen.dart';
import 'package:rafiq/views/shared/input_field.dart';
import 'package:rafiq/views/shared/custom_button.dart';

class FirstForgetPassword extends StatelessWidget {
  FirstForgetPassword({Key? key}) : super(key: key);
  static const routeName = '/first_forget_password';

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  bool customValidteEmail() {
    if (emailController.text.isEmpty ||
        emailController.text.length < 2 ||
        emailController.text.length >= 35) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Scaffold(
      backgroundColor: const Color(0xFFE3E3E3),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: width(16),
            right: width(16),
            top: height(61),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: width(3)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, LoginScreen.routeName);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF000000),
                        size: 25,
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/images/forget_password.png',
                        width: width(295),
                        height: height(217),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height(37),
              ),
              const AutoSizeText(
                'Forget Password?',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6E75A0),
                ),
              ),
              SizedBox(
                height: height(31),
              ),
              Padding(
                padding: EdgeInsets.only(left: width(32), right: width(32)),
                child: const AutoSizeText(
                  'Enter your username or your email address and we will send a link to reset your password.',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF6E75A0),
                  ),
                ),
              ),
              SizedBox(
                height: height(37),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFFFFFFF),
                ),
                width: double.infinity,
                height: height(218),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: width(32),
                    right: width(32),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: height(35)),
                          child: InputField(
                            label: 'Username or Email',
                            sizeoflabel: 20,
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: height(34),
                            ),
                            child: CustomButton(
                              label: 'Send',
                              ontap: () async {
                                if (customValidteEmail()) {
                                  await BlocProvider.of<ForgetCubit>(context)
                                      .forgetPassword(
                                    RequestForgetModel(emailController.text),
                                  );
                                  Navigator.pushReplacementNamed(
                                      context, SecondForgetPassword.routeName);
                                } else {
                                  showValidationTosat(context,
                                      'Please enter your Username or Email ');
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
