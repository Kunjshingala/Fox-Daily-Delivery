import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fox_daily_delivery/screens/preference/my_preference_bloc.dart';
import 'package:fox_daily_delivery/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../intro/intro_screen.dart';

class MyPreferencesScreen extends StatefulWidget {
  const MyPreferencesScreen({super.key});

  @override
  State<MyPreferencesScreen> createState() => _MyPreferencesScreenState();
}

class _MyPreferencesScreenState extends State<MyPreferencesScreen> {
  late MyPreferencesBloc myPreferencesBloc;

  late int languageChoiceIndex;
  late int currencyChoiceIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    languageChoiceIndex = 0;
    currencyChoiceIndex = 0;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    myPreferencesBloc = MyPreferencesBloc(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Preferences',
          style: GoogleFonts.montserrat(
            color: mainTextColor,
            fontWeight: FontWeight.w700,
            fontSize: averageScreenSize * 0.035,
          ),
        ),
        toolbarHeight: screenHeight * 0.07,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: secondaryColor,
      body: Container(
        width: screenWidth,
        height: screenHeight,
        padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth * 0.05),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose your preferred language',
                  style: GoogleFonts.montserrat(
                    color: mainTextColor,
                    fontWeight: FontWeight.w500,
                    fontSize: averageScreenSize * 0.028,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Wrap(
                  spacing: averageScreenSize * 0.02,
                  children: List.generate(
                    myPreferencesBloc.languageList.length,
                    (index) => ChoiceChip(
                      selected: languageChoiceIndex == index,
                      selectedColor: primaryColor,
                      showCheckmark: false,
                      backgroundColor: Colors.transparent,
                      label: Text(
                        myPreferencesBloc.languageList[index],
                        style: GoogleFonts.montserrat(
                          color: languageChoiceIndex == index ? Colors.white : Colors.black,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(averageScreenSize * 0.02),
                        side: BorderSide(
                          color: unselectedBorderColor,
                          style: BorderStyle.solid,
                          width: averageScreenSize * 0.001,
                        ),
                      ),
                      onSelected: (value) {
                        setState(() {
                          languageChoiceIndex = value ? index : languageChoiceIndex;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Divider(
                  color: dividerColor,
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Choose your Currency',
                  style: GoogleFonts.montserrat(
                    color: mainTextColor,
                    fontWeight: FontWeight.w500,
                    fontSize: averageScreenSize * 0.028,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Wrap(
                  spacing: averageScreenSize * 0.02,
                  children: List.generate(
                    myPreferencesBloc.currencyList.length,
                    (index) => ChoiceChip(
                      selected: currencyChoiceIndex == index,
                      selectedColor: primaryColor,
                      showCheckmark: false,
                      label: Text(
                        myPreferencesBloc.currencyList[index],
                        style: GoogleFonts.montserrat(
                          color: currencyChoiceIndex == index ? selectedTextColor : mainTextColor,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(averageScreenSize * 0.02),
                        side: BorderSide(
                          color: unselectedBorderColor,
                          style: BorderStyle.solid,
                          width: averageScreenSize * 0.001,
                        ),
                      ),
                      onSelected: (value) {
                        setState(() {
                          currencyChoiceIndex = value ? index : currencyChoiceIndex;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: screenHeight * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const IntroScreen(),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Continue ',
                              style: GoogleFonts.montserrat(
                                color: selectedTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: averageScreenSize * 0.025,
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/icons/right_icon.svg',
                              color: selectedIconColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myPreferencesBloc.dispose();
  }
}
