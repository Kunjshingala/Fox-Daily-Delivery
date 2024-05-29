import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fox_daily_delivery/utils/colors.dart';
import 'package:fox_daily_delivery/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

import 'buy_once/buy_once_screen.dart';
import 'order_bloc.dart';
import 'order_widgets.dart';
import 'subscription/subscription_screen.dart';

class OrderTabBarScreen extends StatefulWidget {
  const OrderTabBarScreen({super.key});

  @override
  State<OrderTabBarScreen> createState() => _OrderTabBarScreenState();
}

class _OrderTabBarScreenState extends State<OrderTabBarScreen> with SingleTickerProviderStateMixin {
  late OrderTabBarBloc orderTabBarBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    orderTabBarBloc = OrderTabBarBloc(context: context, tickerProvider: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Padding(
            padding: EdgeInsetsDirectional.only(start: averageScreenSize * 0.035),
            child: Transform(
              transform: Matrix4.rotationY(math.pi),
              child: SvgPicture.asset(
                'assets/icons/right_icon.svg',
                color: darkSecondaryIconColor,
                height: averageScreenSize * 0.03,
                width: averageScreenSize * 0.03,
              ),
            ),
          ),
          alignment: AlignmentDirectional.centerEnd,
        ),
        title: Text(
          'My Orders',
          style: GoogleFonts.montserrat(
            color: mainTextColor,
            fontWeight: FontWeight.w700,
            fontSize: averageScreenSize * 0.035,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: averageScreenSize * 0.04),
            child: StreamBuilder<int>(
              stream: orderTabBarBloc.getPrimaryTabIndex,
              builder: (context, snapshot) {
                if (snapshot.data == 0) {
                  /// month drop down.
                  return AppBarMonthDropDown(orderTabBarBloc: orderTabBarBloc);
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(screenWidth, screenHeight * 0.06),
          child: Container(
            width: screenWidth,
            height: screenHeight * 0.05,
            margin: EdgeInsetsDirectional.symmetric(horizontal: screenWidth * 0.06),
            padding: EdgeInsetsDirectional.symmetric(vertical: screenHeight * 0.005),
            decoration: BoxDecoration(
              color: secondaryColor,
              border: Border.all(color: primaryColor, width: averageScreenSize * 0.002),
              borderRadius: BorderRadiusDirectional.circular(averageScreenSize * 0.02),
            ),
            child: TabBar(
              controller: orderTabBarBloc.tabController,
              onTap: (value) {
                orderTabBarBloc.setPrimaryTabIndex(value);
                debugPrint('-------------------------->${orderTabBarBloc.primaryTabIndexSubject.value}');
              },
              labelStyle: GoogleFonts.montserrat(
                color: selectedTextColor,
                fontSize: averageScreenSize * 0.023,
                fontWeight: FontWeight.w400,
              ),
              indicator: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadiusDirectional.circular(averageScreenSize * 0.02),
              ),
              splashBorderRadius: BorderRadius.circular(averageScreenSize * 0.02),
              padding: EdgeInsetsDirectional.zero,
              dividerColor: Colors.transparent,
              unselectedLabelColor: primaryTextColor,
              labelPadding: EdgeInsetsDirectional.symmetric(horizontal: averageScreenSize * 0.007),
              isScrollable: false,
              physics: const NeverScrollableScrollPhysics(),
              tabs: [
                SizedBox(
                  width: screenWidth * 0.49,
                  child: const Tab(
                    text: 'Subscription',
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.49,
                  child: const Tab(
                    text: 'Buy Once',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: orderTabBarBloc.tabController,
        children: [
          StreamBuilder<int>(
            stream: orderTabBarBloc.getSelectedMonth,
            builder: (context, snapshot) {
              return SubscriptionScreen(
                days: orderTabBarBloc.daysInSelectedMonthSubject.valueOrNull ?? 30,
                month: snapshot.data ?? 1,
                year: orderTabBarBloc.year,
              );
            },
          ),
          const BuyOnceScreen(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    orderTabBarBloc.dispose();
  }
}
