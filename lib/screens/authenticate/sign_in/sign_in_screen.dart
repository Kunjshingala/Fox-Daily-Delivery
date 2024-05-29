import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fox_daily_delivery/screens/authenticate/sign_in/sign_in_bloc.dart';
import 'package:fox_daily_delivery/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';
import '../../navigation/main_navigation_screen.dart';
import '../otp_verification/otp_verification_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late SignInBloc signInBloc;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    signInBloc = SignInBloc(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.1,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainNavigationScreen(),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: averageScreenSize * 0.01),
              child: Row(
                children: [
                  Text(
                    'Skip',
                    style: GoogleFonts.montserrat(
                      color: primaryTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: averageScreenSize * 0.01),
                  SvgPicture.asset(
                    'assets/icons/right_icon.svg',
                    color: primaryIconColor,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          width: screenWidth,
          height: screenHeight - (screenHeight * 0.1),
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: screenWidth * 0.08, vertical: screenHeight * 0.001),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/auth/sign_in.png',
                width: screenWidth * 0.8,
                height: screenHeight * 0.3,
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                'SIGN IN',
                style: GoogleFonts.montserrat(
                  color: primaryTextColor,
                  fontWeight: FontWeight.w700,
                  fontSize: averageScreenSize * 0.04,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth * 0.015),
                    constraints: BoxConstraints(maxWidth: screenWidth * 0.36, maxHeight: screenHeight * 0.06),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: mainBorderColor,
                        width: averageScreenSize * 0.001,
                      ),
                      borderRadius: BorderRadius.circular(averageScreenSize * 0.02),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CountryCodePicker(
                          padding: EdgeInsetsDirectional.zero,
                          initialSelection: 'IN',
                          flagWidth: averageScreenSize * 0.04,
                          alignLeft: false,
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          textOverflow: TextOverflow.fade,
                          textStyle: GoogleFonts.montserrat(
                            color: mainTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                          onInit: (value) {
                            signInBloc.countryCodeController.text = value!.dialCode!;
                            debugPrint('----------------------->${signInBloc.countryCodeController.text}');
                          },
                          onChanged: (value) {
                            signInBloc.countryCodeController.text = value.dialCode!;
                            debugPrint('----------------------->${signInBloc.countryCodeController.text}');
                          },
                        ),
                        Icon(
                          CupertinoIcons.chevron_down,
                          color: mainIconColor,
                          size: averageScreenSize * 0.02,
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Flexible(
                    fit: FlexFit.loose,
                    child: TextFormField(
                      controller: signInBloc.numberController,
                      style: GoogleFonts.montserrat(
                        color: mainTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: averageScreenSize * 0.025,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                        label: Text(
                          'Contact Number',
                          style: GoogleFonts.montserrat(
                            color: mainTextColor,
                            fontSize: averageScreenSize * 0.023,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        contentPadding: EdgeInsetsDirectional.symmetric(
                            horizontal: averageScreenSize * 0.04, vertical: averageScreenSize * 0.021),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(averageScreenSize * 0.02),
                          borderSide: BorderSide(
                            color: mainBorderColor,
                            width: averageScreenSize * 0.001,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(averageScreenSize * 0.02),
                          borderSide: BorderSide(
                            color: mainBorderColor,
                            width: averageScreenSize * 0.001,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.05),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OtpVerificationScreen(),
                    ),
                  );
                },
                child: Container(
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.05,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadiusDirectional.circular(averageScreenSize * 0.02),
                  ),
                  child: Center(
                    child: Text(
                      'Send OTP ',
                      style: GoogleFonts.montserrat(
                        color: selectedTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: averageScreenSize * 0.025,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Divider(
                      color: darkDividerColor,
                      height: averageScreenSize * 0.01,
                      indent: screenWidth * 0.25,
                      endIndent: screenWidth * 0.03,
                    ),
                  ),
                  Text(
                    'or',
                    style: GoogleFonts.montserrat(
                        color: dartOptionTextColor, fontSize: averageScreenSize * 0.022),
                  ),
                  Flexible(
                    child: Divider(
                      color: darkDividerColor,
                      height: averageScreenSize * 0.01,
                      indent: screenWidth * 0.03,
                      endIndent: screenWidth * 0.25,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                    child: Material(
                      elevation: averageScreenSize * 0.003,
                      borderRadius: BorderRadiusDirectional.circular(averageScreenSize * 0.02),
                      child: Container(
                        width: screenWidth * 0.4,
                        height: screenHeight * 0.05,
                        decoration: BoxDecoration(
                          color: facebookButtonBG,
                          borderRadius: BorderRadiusDirectional.circular(averageScreenSize * 0.02),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/facebook_icon.svg',
                                color: secondaryColor,
                                height: averageScreenSize * 0.035,
                                width: averageScreenSize * 0.035,
                              ),
                              Text(
                                ' Facebook',
                                style: GoogleFonts.montserrat(
                                  color: selectedTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: averageScreenSize * 0.025,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                    child: Material(
                      elevation: averageScreenSize * 0.003,
                      borderRadius: BorderRadiusDirectional.circular(averageScreenSize * 0.02),
                      child: Container(
                        width: screenWidth * 0.4,
                        height: screenHeight * 0.05,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadiusDirectional.circular(averageScreenSize * 0.02),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/google_icon.svg',
                                height: averageScreenSize * 0.035,
                                width: averageScreenSize * 0.035,
                              ),
                              Text(
                                ' Google',
                                style: GoogleFonts.montserrat(
                                  color: mainTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: averageScreenSize * 0.025,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    signInBloc.dispose();
  }
}
