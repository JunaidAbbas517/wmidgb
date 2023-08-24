import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wmidgb/res/color.dart';

import '../../res/components/round_button.dart';
import '../../res/components/textfield.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';
import '../../view_model/login_view_model/login_contoller.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  ValueNotifier<bool> obscurePassword = ValueNotifier<bool>(true);
  final emailController = TextEditingController();

  final emailFocusNode = FocusNode();

  final passwordController = TextEditingController();

  final passwordFocusNode = FocusNode();
  var provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<LoginViewModel>(context, listen: false);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    obscurePassword.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop:  () async {
       return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title:const  Text('Exit App'),
            content: const Text('Are you sure you want to exit the app?'),
            actions: [
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), //<-- SEE HERE
                child: const  Text('No'),
              ),
              TextButton(
                onPressed: () => exit(0), // <-- SEE HERE
                child: const Text('Yes'),
              ),
            ],
          ),
        );
      },
      child: SafeArea(
          top: false,
          minimum: EdgeInsets.zero,
          bottom: false,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 70.h,
                    ),
                    SizedBox(
                      width: 150.h,
                      height: 150.h,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Image(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/WPDGB1.png'),
                          )),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: 300.w,
                      child: Text(
                        textAlign: TextAlign.center,
                        'Water Management & Irrigation Department Gilgit Baltistan',
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
                      child: Column(
                        children: [
                          InputTextField(
                            myController: emailController,
                            focusNode: emailFocusNode,
                            onFieldSubmittedValue: (value) {
                              Utils.fieldFocusChange(
                                  context, emailFocusNode, passwordFocusNode);
                            },
                            hint: 'Enter your email',
                            keyBoardType: TextInputType.emailAddress,
                            obscureText: false,
                          ),
                          ValueListenableBuilder(
                            valueListenable: obscurePassword,
                            builder: (context, value, child) => InputTextField(
                              myController: passwordController,
                              focusNode: passwordFocusNode,
                              onFieldSubmittedValue: (value) {},
                              hint: 'Enter your password',
                              keyBoardType: TextInputType.emailAddress,
                              obscureText: obscurePassword.value,
                              suffixIcon: InkWell(
                                onTap: () {
                                  obscurePassword.value = !obscurePassword.value;
                                },
                                child: obscurePassword.value
                                    ? const Icon(
                                        Icons.visibility_off_outlined,
                                        color: Colors.black54,
                                      )
                                    : const Icon(
                                        Icons.visibility_outlined,
                                        color: Colors.black87,
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Consumer<LoginViewModel>(
                        builder: (BuildContext context, value, Widget? child) {
                      return ReusableButton(
                        title: 'Login',
                        onPress: () {
                          if (emailController.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                'Please enter email', context);
                          } else if (passwordController.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                'Please enter password', context);
                          } else if (passwordController.text.length < 6) {
                            Utils.flushBarErrorMessage(
                                'Please enter 6 digit password', context);
                          } else {
                            provider.loginApi(context, {
                              'email': emailController.text,
                              'password': passwordController.text,
                            });
                          }
                        },
                        color: AppColors.buttonColor,
                        textColor: AppColors.whiteColor,
                        width: 247.w,
                        height: 57.h,
                        radius: 8.r,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        isLoading: provider.loading,
                      );
                    }),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
