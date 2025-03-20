import 'package:betting_app/constants/assets/assets.dart';
import 'package:betting_app/logic/cubit/navigation/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            TextButton(
                onPressed: () {
                  context.read<NavigationCubit>().navigateToHome();
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )),
          ],
        ),
        backgroundColor: Colors.black45,
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
                    spacing: 20.5,
                    children: [
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(buttonWidth, buttonHeight),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor: const Color(0xFF1877F2)),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Assets.imagesIconsLogoFacebookLogo,
                              height: 30,
                            ),
                            const Expanded(
                              child: Text(
                                'CONTINUA CON FACEBOOK',
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
                                borderRadius: BorderRadius.circular(15))),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Assets.imagesIconsLogoGoogleLogo,
                              height: 30,
                            ),
                            const Expanded(
                              child: Text(
                                'CONTINUA CON GOOGLE',
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
                                borderRadius: BorderRadius.circular(15))),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Assets.imagesIconsLogoAppleLogo,
                              height: 30,
                            ),
                            const Expanded(
                              child: Text(
                                'CONTINUA CON APPLE',
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
                      const SizedBox(
                        height: 15,
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
                              backgroundColor:
                                  const Color.fromRGBO(254, 76, 68, 1)
                                      .withAlpha(245),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          child: const Expanded(
                            child: Text(
                              'CREA NUOVO ACCOUNT',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Playfair Display',
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    ]));
          }),
        ));
  }
}
