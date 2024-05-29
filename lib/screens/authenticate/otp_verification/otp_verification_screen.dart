import 'package:flutter/material.dart';
import 'package:fox_daily_delivery/screens/navigation/main_navigation_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/colors.dart';
import '../../../utils/dimens.dart';
import 'otp_verification_bloc.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  late OtpVerificationBloc otpVerificationBloc;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    otpVerificationBloc = OtpVerificationBloc(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight - (screenHeight * 0.09),
          padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth * 0.08),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.15),
              Image.asset(
                'assets/images/auth/verify_otp.png',
                width: screenWidth * 0.8,
                height: screenHeight * 0.3,
              ),
              SizedBox(height: screenHeight * 0.05),
              Text(
                'VERIFY OTP',
                style: GoogleFonts.montserrat(
                  color: primaryTextColor,
                  fontWeight: FontWeight.w700,
                  fontSize: averageScreenSize * 0.04,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Text(
                'Please enter the OTP sent to 12******91',
                style: GoogleFonts.montserrat(
                  color: optionTextColor,
                  fontSize: averageScreenSize * 0.02,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Pinput(
                controller: otpVerificationBloc.otpController,
                keyboardType: TextInputType.number,
                closeKeyboardWhenCompleted: true,
                length: 4,
                defaultPinTheme: PinTheme(
                  width: averageScreenSize * 0.075,
                  height: averageScreenSize * 0.08,
                  textStyle: GoogleFonts.montserrat(
                    color: mainTextColor,
                    fontSize: averageScreenSize * 0.028,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: optionalBorderColor),
                    borderRadius: BorderRadius.circular(averageScreenSize * 0.02),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: averageScreenSize * 0.075,
                  height: averageScreenSize * 0.08,
                  textStyle: GoogleFonts.montserrat(
                    color: mainTextColor,
                    fontSize: averageScreenSize * 0.028,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: optionalBorderColor),
                    borderRadius: BorderRadius.circular(averageScreenSize * 0.02),
                  ),
                ),
                separatorBuilder: (index) {
                  return Container(
                    width: screenWidth * 0.06,
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.05),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainNavigationScreen(),
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
                      'Verify',
                      style: GoogleFonts.montserrat(
                        color: selectedTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: averageScreenSize * 0.025,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: screenWidth * 0.4,
                      height: screenHeight * 0.05,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadiusDirectional.circular(averageScreenSize * 0.02),
                        border: Border.all(color: optionalBorderColor),
                      ),
                      child: Center(
                        child: Text(
                          'Edit Number',
                          style: GoogleFonts.montserrat(
                            color: mainTextColor.withOpacity(0.8),
                            fontWeight: FontWeight.w600,
                            fontSize: averageScreenSize * 0.025,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: screenWidth * 0.4,
                      height: screenHeight * 0.05,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadiusDirectional.circular(averageScreenSize * 0.02),
                        border: Border.all(color: optionalBorderColor),
                      ),
                      child: Center(
                        child: Text(
                          'Resend Code',
                          style: GoogleFonts.montserrat(
                            color: mainTextColor.withOpacity(0.8),
                            fontWeight: FontWeight.w600,
                            fontSize: averageScreenSize * 0.025,
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
    otpVerificationBloc.dispose();
  }
}
