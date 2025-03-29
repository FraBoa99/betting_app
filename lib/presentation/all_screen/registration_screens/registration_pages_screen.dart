// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:betting_app/data/models/local_user.dart';
import 'package:betting_app/logic/cubit/authentication/auth_cubit.dart';
import 'package:betting_app/logic/cubit/navigation/navigation_cubit.dart';
import 'package:betting_app/logic/cubit/user/user_cubit.dart';
import 'package:betting_app/logic/cubit/user/user_state.dart';
import 'package:betting_app/presentation/all_screen/registration_screens/sign_in_flow_step/birthdate_step.dart';
import 'package:betting_app/presentation/all_screen/registration_screens/sign_in_flow_step/email_step.dart';
import 'package:betting_app/presentation/all_screen/registration_screens/sign_in_flow_step/name_step.dart';
import 'package:betting_app/presentation/all_screen/registration_screens/sign_in_flow_step/nickname_step.dart';
import 'package:betting_app/presentation/all_screen/registration_screens/sign_in_flow_step/password_step.dart';
import 'package:betting_app/presentation/all_screen/registration_screens/sign_in_flow_step/summary_step.dart';
import 'package:betting_app/presentation/all_widget/widget/loading_indicator_widget.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

enum Page {
  namePage(0),
  birthdayPage(1),
  emailPage(2),
  nicknamePage(3),
  passwordPage(4),
  summaryPage(5);

  final int value;
  const Page(this.value);
}

// ignore: must_be_immutable
class RegistrationPagesScreen extends StatefulWidget {
  const RegistrationPagesScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegistrationFlowState();
}

class _RegistrationFlowState extends State<RegistrationPagesScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isEditingProfile = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String name = '';
  String surname = '';
  String email = '';
  String nickname = '';
  String currency = '';
  DateTime? birthday;
  String _password = '';

  LocalUser _createUser() {
    var uuid = const Uuid();

    return LocalUser(
        uid: uuid.v4(),
        name: name,
        surname: surname,
        email: email,
        nickname: nickname,
        dateOfBirth: birthday.toString(),
        currency: currency,
        balance: 0.0,
        betsCount: 0,
        winningBets: 0,
        losingBets: 0,
        isFirstLogin: true,
        provider: 'email');
  }

  Future<void> _registerUserToFirestore() async {
    LocalUser user = _createUser();
    if (user.email.isNotEmpty) {
      try {
        await context.read<AuthCubit>().createAccountWithEmail(user, _password);
      } catch (e) {
        print("Error adding user to Firestore: $e");
        rethrow;
      }
    } else {
      print("Invalid user data. Cannot push to Firestore.");
      return;
    }
  }

  void _jumpToPage(int index, bool isEditingProfile) {
    _pageController.jumpToPage(index);
    if (isEditingProfile || _isEditingProfile) {
      _isEditingProfile = isEditingProfile;
    }
  }

  void _nextPage() {
    if (_isEditingProfile) {
      _jumpToPage(6,
          _isEditingProfile); //Se l'utente stava modificando i dati, torniamo al summary
    } else if (_currentPage < 6) {
      setState(() {
        _currentPage++;
      });
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _previousPage() {
    if (_isEditingProfile && _currentPage != Page.summaryPage.value) {
      _jumpToPage(6,
          _isEditingProfile); //Se l'utente stava modificando i dati, torniamo al summary
    } else if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      context.read<NavigationCubit>().navigateToSignupPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (BuildContext context, state) {
        if (state is UserLoaded) {
          context.read<NavigationCubit>().navigateToWrappedHome();
        } else if (state is UserLoading) {
          const LoadingIndicatorWidget(message: "");
        }
      },
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
                color: Colors.white,
                onPressed: () {
                  _previousPage();
                },
                icon: const Icon(Icons.arrow_back)),
            actions: [
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  context.read<NavigationCubit>().navigateToSignupPage();
                },
              ),
            ],
          ),
          body: Column(children: [
            Expanded(
                child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                NameStep(
                    nameController: _nameController,
                    surnameController: _surnameController,
                    onNext: (name, surname) {
                      setState(() {
                        this.name = name;
                        this.surname = surname;
                      });
                      _nextPage();
                    }),
                BirthdateStep(
                    dateController: _dateController,
                    isEditingProfile: _isEditingProfile,
                    onNext: (value, isEditing) {
                      setState(() {
                        birthday = value;
                        _isEditingProfile = isEditing;
                      });
                      _nextPage();
                    }),
                EmailStep(
                    emailController: _emailController,
                    isEditingProfile: _isEditingProfile,
                    onNext: (value, isEditing) {
                      setState(() {
                        email = value;
                        _isEditingProfile = isEditing;
                      });
                      _nextPage();
                    }),
                NicknameStep(
                    nicknameController: _nicknameController,
                    isEditingProfile: _isEditingProfile,
                    onNext: (value, isEditing) {
                      setState(() {
                        nickname = value;
                        _isEditingProfile = isEditing;
                      });
                      _nextPage();
                    }),
                PasswordStep(
                  passwordController: _passwordController,
                  isEditingProfile: _isEditingProfile,
                  onNext: (value, isEditing) {
                    setState(() {
                      _password = value;
                      _isEditingProfile = isEditing;
                    });
                    _nextPage();
                  },
                ),
                SummaryStep(
                  name: name,
                  email: email,
                  birthday: birthday,
                  nickname: nickname,
                  password: _password,
                  onEditName: () {
                    _jumpToPage(0, true);
                    _isEditingProfile = true;
                  },
                  onEditBirthday: () {
                    _jumpToPage(1, true);
                    _isEditingProfile = true;
                  },
                  onEditEmail: () {
                    _jumpToPage(2, true);
                    _isEditingProfile = true;
                  },
                  onEditNickname: () {
                    _jumpToPage(3, true);
                    _isEditingProfile = true;
                  },
                  onSubmit: () async {
                    await _registerUserToFirestore();
                    return null;
                  },
                )
              ],
            )),
          ])),
    );
  }
}
