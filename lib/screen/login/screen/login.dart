import 'package:betting_app/cubits/auth/auth_cubit.dart';
import 'package:betting_app/cubits/auth/auth_state.dart';
import 'package:betting_app/navigation/app_routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            Navigator.pushReplacementNamed(context, '/home');
          } else if (state is AuthError) {
            print(state.message);
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
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              width: 1,
                              color: Theme.of(context).colorScheme.primary))),
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
                            color: Theme.of(context).colorScheme.primary),
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
                height: 80,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<AuthCubit>().signInWithEmail(
                        _emailTextController.text,
                        _passwordTextController.text);
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(325, 55),
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
                child: Text('Or'),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        context.read<AuthCubit>().signInWithGoogle();
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 60),
                          backgroundColor:
                              const Color.fromARGB(255, 183, 222, 10),
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child:
                          const Text('Google', style: TextStyle(fontSize: 18))),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<AuthCubit>().signinWithFacebook();
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 60),
                          backgroundColor:
                              const Color.fromARGB(255, 183, 222, 10),
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: const Text('Facebook',
                          style: TextStyle(fontSize: 18))),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.primary),
                      children: [
                    TextSpan(
                        text: 'Sing Up',
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
