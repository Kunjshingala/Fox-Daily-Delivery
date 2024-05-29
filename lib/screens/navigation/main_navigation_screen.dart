import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fox_daily_delivery/screens/navigation/main_navigation_bloc.dart';
import 'package:fox_daily_delivery/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../utils/colors.dart';
import 'home/home_screen.dart';
import 'order/order_screen.dart';
import 'subscriptions/subscriptions_tab_screen.dart';
import 'wallet/wallet_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late MainNavigationBloc mainNavigationBloc;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    mainNavigationBloc = MainNavigationBloc(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: mainNavigationBloc.getPage,
      builder: (context, snapshot) {
        return PersistentTabView(
          context,
          controller: mainNavigationBloc.persistentTabController,
          hideNavigationBarWhenKeyboardShows: false,
          hideNavigationBar: false,
          resizeToAvoidBottomInset: true,
          navBarStyle: NavBarStyle.simple,
          onItemSelected: (value) {
            mainNavigationBloc.setPage(value);
            debugPrint('----------------------->${mainNavigationBloc.pageSubject.value}');
          },
          screens: const [
            HomeScreen(),
            OrderTabBarScreen(),
            WalletScreen(),
            SubscriptionTabScreen(),
          ],
          navBarHeight: screenHeight * 0.08,
          padding: NavBarPadding.only(bottom: averageScreenSize * 0.025),
          items: [
            PersistentBottomNavBarItem(
              title: 'Home',
              textStyle: GoogleFonts.montserrat(
                fontSize: averageScreenSize * 0.02,
                height: averageScreenSize * 0.0005,
              ),
              icon: SvgPicture.asset(
                'assets/icons/home_icon.svg',
                width: averageScreenSize * 0.03,
                height: averageScreenSize * 0.03,
                color: snapshot.data == 0 ? primaryIconColor : secondaryIconColor,
              ),
              activeColorPrimary: primaryColor,
              inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
              title: 'Orders',
              textStyle: GoogleFonts.montserrat(
                fontSize: averageScreenSize * 0.02,
                height: averageScreenSize * 0.0005,
              ),
              icon: SvgPicture.asset(
                'assets/icons/orders_icon.svg',
                width: averageScreenSize * 0.03,
                height: averageScreenSize * 0.03,
                color: snapshot.data == 1 ? primaryIconColor : secondaryIconColor,
              ),
              activeColorPrimary: primaryColor,
              inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
              title: 'Wallet',
              textStyle: GoogleFonts.montserrat(
                fontSize: averageScreenSize * 0.02,
                height: averageScreenSize * 0.0005,
              ),
              icon: SvgPicture.asset(
                'assets/icons/wallet_icon.svg',
                width: averageScreenSize * 0.03,
                height: averageScreenSize * 0.03,
                color: snapshot.data == 2 ? primaryIconColor : secondaryIconColor,
              ),
              activeColorPrimary: primaryColor,
              inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
              title: 'Subscriptions',
              textStyle: GoogleFonts.montserrat(
                fontSize: averageScreenSize * 0.02,
                height: averageScreenSize * 0.0005,
              ),
              icon: SvgPicture.asset(
                'assets/icons/subscription_icon.svg',
                width: averageScreenSize * 0.03,
                height: averageScreenSize * 0.03,
                color: snapshot.data == 3 ? primaryIconColor : secondaryIconColor,
              ),
              activeColorPrimary: primaryColor,
              inactiveColorPrimary: Colors.grey,
            ),
          ],
        );
      },
    );
  }
}
