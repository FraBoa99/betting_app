import 'package:betting_app/core/config/theme/app_colors.dart';
import 'package:betting_app/logic/cubit/authentication/auth_cubit.dart';
import 'package:betting_app/logic/cubit/navigation/navigation_cubit.dart';
import 'package:betting_app/logic/cubit/user/user_cubit.dart';
import 'package:betting_app/logic/cubit/user/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoaded) {
          context.read<NavigationCubit>().navigateToUserHome();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.bgHome,
          title: const Text(
            'Login with email',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  context.read<NavigationCubit>().navigateToSignupPage();
                },
                child: const Text(
                  'Back',
                  style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                )),
          ],
        ),
        backgroundColor: AppColors.bgHome,
        body: SafeArea(
          child: LayoutBuilder(builder: (context, constraints) {
            double buttonWidth =
                constraints.maxWidth * 0.7; // 60% della larghezza
            double buttonHeight = constraints.maxHeight * 0.07;
            return Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'EMAIL ADDRESS',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          gradient: AppColors.bgTextFieldReg.withOpacity(0.17),
                          borderRadius: BorderRadius.circular(8)),
                      child: TextField(
                        controller: emailController,
                        autocorrect: false,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(30),
                        ],
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            hintText: 'Please enter your email',
                            hintStyle: TextStyle(fontSize: 18)),
                        style: const TextStyle(
                          fontSize: 23,
                        ),
                      )),
                  const SizedBox(
                    height: 25,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'PASSWORD',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          gradient: AppColors.bgTextFieldReg.withOpacity(0.17),
                          borderRadius: BorderRadius.circular(8)),
                      child: TextField(
                        controller: passwordController,
                        autocorrect: false,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(30),
                        ],
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            hintText: 'Please enter your password',
                            hintStyle: TextStyle(fontSize: 18)),
                        style: const TextStyle(
                          fontSize: 23,
                        ),
                      )),
                  const Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        context.read<AuthCubit>().signInWithEmail(
                            emailController.text, passwordController.text);
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(buttonWidth, buttonHeight),
                          backgroundColor: AppColors.bgCircleIcon,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: const Text(
                        'LOGIN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Playfair Display',
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      )),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
