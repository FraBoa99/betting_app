import 'package:betting_app/cubits/auth/auth_cubit.dart';
import 'package:betting_app/cubits/auth/auth_state.dart';
import 'package:betting_app/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<StatefulWidget> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _isObscured = true;
  final _nicknameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Sign Up Now'),
        ),
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AccountCreate) {
              Navigator.pushNamed(context, AppRoutes.home);
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
                    controller: _nicknameTextController,
                    decoration: InputDecoration(
                        labelText: 'Nickname',
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
                const SizedBox(
                  height: 80,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<AuthCubit>().createAccountWithEmail(
                          _emailTextController.text,
                          _passwordTextController.text);
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(325, 55),
                        backgroundColor:
                            const Color.fromARGB(255, 183, 222, 10),
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: const Text('Create Account',
                        style: TextStyle(fontSize: 18))),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ));
  }
}
