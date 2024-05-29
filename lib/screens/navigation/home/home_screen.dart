import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fox_daily_delivery/screens/navigation/home/home_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';
import '../../../utils/dimens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc homeBloc;

  final screenHorizontalPadding = screenWidth * 0.04;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    homeBloc = HomeBloc(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        backgroundColor: secondaryColor,
        title: Row(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(end: screenHeight * 0.015),
              child: SvgPicture.asset(
                'assets/icons/location_icon.svg',
                color: primaryIconColor,
                height: averageScreenSize * 0.045,
                width: averageScreenSize * 0.045,
                fit: BoxFit.fitWidth,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sheetal Park',
                  style: GoogleFonts.montserrat(
                    color: mainTextColor,
                    fontSize: averageScreenSize * 0.03,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Manharpura 1, Dharam nagar',
                  style: GoogleFonts.montserrat(
                    color: mainTextColor,
                    fontSize: averageScreenSize * 0.025,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: screenHorizontalPadding),
              child: SvgPicture.asset(
                'assets/icons/user_profile_icon.svg',
                color: secondaryIconColor,
                width: averageScreenSize * 0.045,
                height: averageScreenSize * 0.045,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: secondaryColor,
      body: SizedBox(
        height: screenHeight - (screenHeight * 0.08),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: screenHorizontalPadding,
                  vertical: screenHeight * 0.02,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: homeBloc.productTextController,
                      style: GoogleFonts.montserrat(
                        color: mainTextColor,
                        fontSize: averageScreenSize * 0.025,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Search for \'Milk\'',
                        hintStyle: GoogleFonts.montserrat(
                          color: optionTextColor,
                          fontSize: averageScreenSize * 0.025,
                          fontWeight: FontWeight.w400,
                        ),
                        contentPadding: EdgeInsetsDirectional.symmetric(
                          horizontal: screenWidth * 0.05,
                          vertical: screenHeight * 0.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: optionalBorderColor),
                          borderRadius: BorderRadius.circular(averageScreenSize * 0.02),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: optionalBorderColor),
                          borderRadius: BorderRadius.circular(averageScreenSize * 0.02),
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsetsDirectional.all(averageScreenSize * 0.028),
                          child: SvgPicture.asset(
                            'assets/icons/search_icon.svg',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CarouselSlider(
                      carouselController: homeBloc.firstCarouselController,
                      options: CarouselOptions(
                        height: screenHeight * 0.15,
                        autoPlay: true,
                        initialPage: 0,
                        viewportFraction: 1,
                        scrollDirection: Axis.horizontal,
                        reverse: false,
                        autoPlayInterval: const Duration(seconds: 2),
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          homeBloc.setCarouselPage(index);
                        },
                      ),
                      items: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(averageScreenSize * 0.02),
                          child: Image.asset(
                            'assets/images/home/offer_slider_1.png',
                            fit: BoxFit.fitWidth,
                            width: screenWidth - (screenHorizontalPadding),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(averageScreenSize * 0.02),
                          child: Image.asset(
                            'assets/images/home/offer_slider_2.png',
                            fit: BoxFit.fitWidth,
                            width: screenWidth - (screenHorizontalPadding),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(averageScreenSize * 0.02),
                          child: Image.asset(
                            'assets/images/home/offer_slider_1.png',
                            fit: BoxFit.fitWidth,
                            width: screenWidth - (screenHorizontalPadding),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    StreamBuilder<int>(
                      stream: homeBloc.getCarouselPage,
                      builder: (context, snapshot) {
                        return DotsIndicator(
                          mainAxisSize: MainAxisSize.min,
                          dotsCount: 3,
                          position: snapshot.data ?? 0,
                          decorator: DotsDecorator(
                            color: secondaryIconColor,
                            activeColor: mainIconColor.withOpacity(0.7),
                            size: Size.fromRadius(averageScreenSize * 0.006),
                            activeSize: Size.fromRadius(averageScreenSize * 0.007),
                            spacing: EdgeInsets.all(averageScreenSize * 0.002),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Flexible(
                      fit: FlexFit.loose,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: homeBloc.homeGridItemList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                homeBloc.homeGridItemList[index].image.trim(),
                                fit: BoxFit.fill,
                                width: screenWidth * 0.25,
                                height: averageScreenSize * 0.15,
                                alignment: AlignmentDirectional.center,
                              ),
                              Flexible(
                                fit: FlexFit.loose,
                                child: Text(
                                  homeBloc.homeGridItemList[index].label,
                                  style: GoogleFonts.montserrat(
                                    color: mainTextColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: averageScreenSize * 0.025,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    CarouselSlider(
                      carouselController: homeBloc.firstCarouselController,
                      options: CarouselOptions(
                        height: screenHeight * 0.15,
                        autoPlay: true,
                        initialPage: 0,
                        viewportFraction: 1,
                        scrollDirection: Axis.horizontal,
                        reverse: false,
                        autoPlayInterval: const Duration(seconds: 2),
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          homeBloc.setCarouselPage(index);
                        },
                      ),
                      items: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(averageScreenSize * 0.02),
                          child: Image.asset(
                            'assets/images/home/offer_slider_2.png',
                            fit: BoxFit.fitWidth,
                            width: screenWidth - (screenHorizontalPadding),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(averageScreenSize * 0.02),
                          child: Image.asset(
                            'assets/images/home/offer_slider_1.png',
                            fit: BoxFit.fitWidth,
                            width: screenWidth - (screenHorizontalPadding),
                          ),
                        ),
                        Image.asset(
                          'assets/images/home/offer_slider_2.png',
                          fit: BoxFit.fitWidth,
                          width: screenWidth - (screenHorizontalPadding),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    SizedBox(
                      width: screenWidth,
                      child: Text(
                        'Featured Product',
                        style: GoogleFonts.montserrat(
                          color: mainTextColor,
                          fontSize: averageScreenSize * 0.035,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Flexible(
                      fit: FlexFit.loose,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: homeBloc.homeFeaturedItemList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsetsDirectional.symmetric(vertical: screenHeight * 0.015),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(averageScreenSize * 0.01),
                                      child: Image.asset(
                                        homeBloc.homeFeaturedItemList[index].image,
                                        width: averageScreenSize * 0.155,
                                        height: averageScreenSize * 0.15,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    SizedBox(width: averageScreenSize * 0.02),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(maxWidth: screenWidth * 0.6),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            homeBloc.homeFeaturedItemList[index].label,
                                            style: GoogleFonts.montserrat(
                                              color: mainTextColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: averageScreenSize * 0.028,
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: homeBloc.homeFeaturedItemList[index].category,
                                                  style: GoogleFonts.montserrat(
                                                    color: mainTextColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: averageScreenSize * 0.025,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' (${homeBloc.homeFeaturedItemList[index].quantity})',
                                                  style: GoogleFonts.montserrat(
                                                    color: dartOptionTextColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: averageScreenSize * 0.025,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: screenHeight * 0.01),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              width: screenWidth * 0.25,
                                              height: screenHeight * 0.04,
                                              decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius: BorderRadiusDirectional.circular(
                                                    averageScreenSize * 0.02),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Subscribe',
                                                  style: GoogleFonts.montserrat(
                                                    color: selectedTextColor,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: averageScreenSize * 0.025,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      homeBloc.homeFeaturedItemList[index].discountPrice,
                                      style: GoogleFonts.montserrat(
                                        color: mainTextColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: averageScreenSize * 0.03,
                                      ),
                                    ),
                                    Text(
                                      homeBloc.homeFeaturedItemList[index].actualPrice,
                                      style: GoogleFonts.montserrat(
                                        color: optionTextColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: averageScreenSize * 0.025,
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: dartOptionTextColor,
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.01),
                                    Text(
                                      'Buy Now',
                                      style: GoogleFonts.montserrat(
                                        color: primaryTextColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: averageScreenSize * 0.025,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.06),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: screenHeight * 0.07,
                padding: EdgeInsetsDirectional.symmetric(horizontal: screenHorizontalPadding),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors: [
                      Color(0xffffffff),
                      Color(0xffd4f6f2),
                      Color(0xffaaede5),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/order_details_icon.svg',
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: ' Pay \$ 260 ',
                                style: GoogleFonts.montserrat(
                                  color: mainTextColor,
                                  fontSize: averageScreenSize * 0.025,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: '(2 items)',
                                style: GoogleFonts.montserrat(
                                  color: mainTextColor,
                                  fontSize: averageScreenSize * 0.025,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.045,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadiusDirectional.circular(averageScreenSize * 0.02),
                        ),
                        child: Center(
                          child: Text(
                            'View cart',
                            style: GoogleFonts.montserrat(
                              color: selectedTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: averageScreenSize * 0.025,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
  }
}
