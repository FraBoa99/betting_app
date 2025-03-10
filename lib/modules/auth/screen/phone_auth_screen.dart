import 'package:betting_app/modules/auth/cubit/auth_cubit.dart';
import 'package:betting_app/modules/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({super.key});

  @override
  State<StatefulWidget> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final List<String> _countryCodes = ['+39', '+43', '+32', '+90'];
  late String _selectedCountryCode = '+39';
  var _isPhoneTextVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Enter your phone',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 28,
          ),
        ),
      ),
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
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
            child: Column(
              children: [
                const Text(
                    'You will recive a 4 digit code to verify your identity',
                    style: TextStyle(color: Colors.grey)),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Visibility(
                      visible: _isPhoneTextVisible,
                      child: Container(
                        padding: const EdgeInsets.only(left: 60),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: '    Phone Number',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 12,
                      child: DropdownButton<String>(
                        borderRadius: BorderRadius.circular(8),
                        value: _selectedCountryCode,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedCountryCode = newValue!;
                          });
                        },
                        items: _countryCodes
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        underline: const SizedBox(),
                        icon: const Icon(Icons.arrow_drop_down),
                        isExpanded: false,
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: !_isPhoneTextVisible,
                  child: Container(
                      padding: const EdgeInsets.only(left: 60),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: _codeController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'Enter a verification code',
                          border: InputBorder.none,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_isPhoneTextVisible) {
                        //In questo caso vogliamo ricevere il codice OTP
                        final phoneNumber =
                            _selectedCountryCode + _phoneController.text;
                        context.read<AuthCubit>().sendCode(phoneNumber);
                      } else {
                        //In questo caso vogliamo effettuare la login con il codice OTP
                        context
                            .read<AuthCubit>()
                            .signInWithOTP(_codeController.text);
                      }
                      setState(() {
                        _isPhoneTextVisible = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(250, 55),
                        backgroundColor:
                            const Color.fromARGB(255, 183, 222, 10),
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child:
                        const Text('Send Code', style: TextStyle(fontSize: 18)))
              ],
            ),
          )),
    );
  }
}
