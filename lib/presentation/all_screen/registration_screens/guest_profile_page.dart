// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:betting_app/constants/assets/assets.dart';
import 'package:betting_app/core/config/theme/app_colors.dart';
import 'package:betting_app/logic/cubit/navigation/navigation_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GuestProfilePage extends StatelessWidget {
  const GuestProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgHome,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            TextButton(
                onPressed: () {
                  context.read<NavigationCubit>().navigateToWrappedHome();
                },
                child: const Text(
                  'Back',
                  style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                )),
          ],
        ),
        body: Center(
          child: LayoutBuilder(builder: (context, constraints) {
            double buttonWidth =
                constraints.maxWidth * 0.7; // 60% della larghezza
            double buttonHeight = constraints.maxHeight * 0.07;

            return Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 80),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 22,
                    children: [
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(buttonWidth, buttonHeight),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor: const Color(0xFF1877F2)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.logoFacebookLogo,
                              height: 30,
                            ),
                            //const Spacer(),
                            const Expanded(
                              child: Text(
                                'CONTINUE WITH FACEBOOK',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Playfair Display',
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ),
                      //Google button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(buttonWidth, buttonHeight),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor: Colors.white),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.logoGoogleLogo,
                              height: 30,
                            ),
                            const Expanded(
                              child: Text(
                                'CONTINUE WITH GOOGLE',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Playfair Display',
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ),

                      //Apple button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(buttonWidth, buttonHeight),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor: Colors.white),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.logoAppleLogo,
                              height: 30,
                            ),
                            const Expanded(
                              child: Text(
                                'CONTINUE WITH APPLE',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Playfair Display',
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(),
                      const Divider(
                        thickness: 1.3,
                      ),
                      //CREA ACCOUNT BUTTON
                      ElevatedButton(
                          onPressed: () {
                            context
                                .read<NavigationCubit>()
                                .navigateToCrateAccount();
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(buttonWidth, buttonHeight),
                              backgroundColor: AppColors.bgCircleIcon,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: const Text(
                            'CREATE ACCOUNT',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Playfair Display',
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          )),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          children: [
                            const TextSpan(
                                text: "Already registered?",
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                              text: " Login",
                              style: const TextStyle(color: Colors.blueAccent),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context
                                      .read<NavigationCubit>()
                                      .navigateToLogin();
                                },
                            ),
                          ],
                        ),
                      )
                    ]));
          }),
        ));
  }
}
