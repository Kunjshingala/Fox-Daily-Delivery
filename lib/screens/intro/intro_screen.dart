import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fox_daily_delivery/screens/intro/intro_screen_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../../utils/dimens.dart';
import '../authenticate/sign_in/sign_in_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late IntroBloc introBloc;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    introBloc = IntroBloc(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.07,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth * 0.05),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: screenHeight * 0.5,
                    autoPlay: false,
                    initialPage: introBloc.carouselPageSubject.valueOrNull ?? 0,
                    viewportFraction: 1,
                    scrollDirection: Axis.horizontal,
                    reverse: false,
                    enlargeCenterPage: false,
                    onPageChanged: (index, reason) {
                      introBloc.setCarouselPage(index);
                    },
                  ),
                  items: const [
                    IntroPage(
                      image: 'assets/images/intro/Intro_1.png',
                      title: 'Chosse From wide range of premium products',
                    ),
                    IntroPage(
                      image: 'assets/images/intro/Intro_2.png',
                      title: 'Easy and Online payment with Subscription',
                    ),
                    IntroPage(
                      image: 'assets/images/intro/Intro_3.png',
                      title: 'Quick and safe delivery at your door step',
                    ),
                  ],
                ),
                StreamBuilder<int>(
                  stream: introBloc.getCarouselPage,
                  builder: (context, snapshot) {
                    return DotsIndicator(
                      dotsCount: 3,
                      position: snapshot.data ?? 0,
                      decorator: DotsDecorator(
                        color: lightOptionColor,
                        activeColor: lightOptionColor,
                        size: Size.fromRadius(averageScreenSize * 0.007),
                        activeSize: Size(averageScreenSize * 0.03, averageScreenSize * 0.012),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(averageScreenSize * 0.01)),
                        spacing: EdgeInsets.all(averageScreenSize * 0.002),
                      ),
                    );
                  },
                ),
                SizedBox(height: screenHeight * 0.15),
              ],
            ),
            Positioned(
              bottom: screenHeight * 0.07,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
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
                          'Skip ',
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
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    introBloc.dispose();
  }
}

class IntroPage extends StatelessWidget {
  const IntroPage({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: screenWidth,
          height: screenHeight * 0.3,
        ),
        SizedBox(height: screenHeight * 0.03),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: averageScreenSize * 0.04,
          ),
        ),
        SizedBox(height: screenHeight * 0.025),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            fontSize: averageScreenSize * 0.022,
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
      ],
    );
  }
}
