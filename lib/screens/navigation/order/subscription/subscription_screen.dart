import 'package:flutter/material.dart';
import 'package:fox_daily_delivery/utils/dimens.dart';

import '../../../../utils/colors.dart';
import 'subscription_bloc.dart';

class SubscriptionScreen extends StatefulWidget {
  final int days;
  final int month;
  final int year;

  const SubscriptionScreen({super.key, required this.days, required this.month, required this.year});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> with TickerProviderStateMixin {
  late SubscriptionBloc subscriptionBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    subscriptionBloc = SubscriptionBloc(context: context);
    subscriptionBloc.getListOfDays(widget.days, widget.month, widget.year, this);
  }

  @override
  Widget build(BuildContext context) {
    subscriptionBloc.tabController.dispose();
    subscriptionBloc.getListOfDays(widget.days, widget.month, widget.year, this);
    subscriptionBloc.setSelectedTab(0);

    return Column(
      children: [
        Container(
          margin: EdgeInsetsDirectional.symmetric(
            vertical: screenHeight * 0.02,
            horizontal: screenWidth * 0.05,
          ),
          constraints: BoxConstraints.tight(
            Size(screenWidth, screenHeight * 0.1),
          ),
          child: TabBar(
            controller: subscriptionBloc.tabController,
            isScrollable: true,
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            indicator: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(averageScreenSize * 0.05),
            ),
            onTap: (value) {
              subscriptionBloc.setSelectedTab(value);
            },
            padding: EdgeInsetsDirectional.symmetric(vertical: averageScreenSize * 0),
            labelPadding: EdgeInsetsDirectional.symmetric(horizontal: averageScreenSize * 0.005),
            // indicatorPadding: EdgeInsetsDirectional.symmetric(horizontal: averageScreenSize * 0.001),
            tabs: subscriptionBloc.daysTabList,
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: TabBarView(
            controller: subscriptionBloc.tabController,
            children: subscriptionBloc.pageList,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscriptionBloc.dispose();
  }
}
