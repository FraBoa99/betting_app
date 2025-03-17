import 'package:betting_app/assets/assets.dart';
import 'package:betting_app/core/app_routes.dart';
import 'package:betting_app/logic/cubit/authentication/auth_cubit.dart';
import 'package:betting_app/logic/cubit/authentication/auth_state.dart';
import 'package:betting_app/presentation/screen/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthStartScreen extends StatefulWidget {
  const AuthStartScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AuthStartScreenState();
}

class _AuthStartScreenState extends State<AuthStartScreen> {
  bool _isObscured = true;

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Home(
                      localUser: null,
                    )));
          } else if (state is AuthLoading) {
            //Caricamento rotella ui
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 325,
                height: 60,
                child: TextField(
                  controller: _emailTextController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              width: 0.2,
                              color: Theme.of(context)
                                  .colorScheme
                                  .inversePrimary))),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 325,
                height: 60,
                child: TextField(
                  obscureText: _isObscured,
                  controller: _passwordTextController,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                          icon: Icon(
                            _isObscured
                                ? Icons.visibility
                                : Icons.visibility_off,
                          )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              width: 0.2,
                              color: Theme.of(context)
                                  .colorScheme
                                  .inversePrimary))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 120.0),
                child: RichText(
                    text: TextSpan(
                        text: 'Forgot Password?  ',
                        style: TextStyle(
                            fontSize: 15,
                            color:
                                Theme.of(context).colorScheme.onPrimaryFixed),
                        children: [
                      TextSpan(
                          text: 'Reset',
                          style:
                              const TextStyle(color: Colors.blue, fontSize: 16),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, AppRoutes.forgotPassword);
                            }),
                    ])),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<AuthCubit>().signInWithEmail(
                        _emailTextController.text,
                        _passwordTextController.text);
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 55),
                      backgroundColor: const Color.fromARGB(255, 183, 222, 10),
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: const Text('Login', style: TextStyle(fontSize: 18))),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(''),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 200,
                height: 55,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.phoneLogin);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.imagesAppPhoneLogo,
                          width: 25,
                          height: 25,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Phone',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryFixed),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 200,
                height: 55,
                child: ElevatedButton(
                    onPressed: () {
                      // context.read<AuthCubit>().signInWithGoogle();
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100, 60),
                        backgroundColor: Colors.white,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.imagesIconsLogoGoogleLogo,
                          width: 25,
                          height: 25,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Google',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryFixed),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              const SizedBox(
                width: 30,
                height: 20,
              ),
              RichText(
                  text: TextSpan(
                      text: "New user? ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.onPrimaryFixed),
                      children: [
                    TextSpan(
                        text: 'Create Account',
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 16),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, AppRoutes.signup);
                          }),
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
