import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimens.dart';
import 'subscription_bloc.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({
    super.key,
    required this.subscriptionBloc,
  });

  final SubscriptionBloc subscriptionBloc;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: subscriptionBloc.dayList.length,
      itemBuilder: (context, index) {
        return Container(
          margin:
              EdgeInsetsDirectional.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusDirectional.circular(averageScreenSize * 0.02),
                        child: Image.asset(
                          'assets/images/home/milk_carton.png',
                          height: averageScreenSize * 0.15,
                          width: averageScreenSize * 0.15,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200.withOpacity(0.5),
                            borderRadius: BorderRadiusDirectional.circular(averageScreenSize * 0.02),
                          ),
                          alignment: AlignmentDirectional.center,
                          width: averageScreenSize * 0.15,
                          height: screenHeight * 0.025,
                          child: Text(
                            '20 % off',
                            style: GoogleFonts.montserrat(
                              color: selectedTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: averageScreenSize * 0.022,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: averageScreenSize * 0.02),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: screenWidth * 0.5),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Amul milk amul milk amul ',
                                style: GoogleFonts.montserrat(
                                  color: mainTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: averageScreenSize * 0.025,
                                ),
                              ),
                              TextSpan(
                                text: '(100 gms.)',
                                style: GoogleFonts.montserrat(
                                  color: optionTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: averageScreenSize * 0.025,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: averageScreenSize * 0.01),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Category',
                            style: GoogleFonts.montserrat(
                              color: optionTextColor,
                              fontWeight: FontWeight.w600,
                              fontSize: averageScreenSize * 0.025,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.025),
                          Container(
                            width: screenWidth * 0.25,
                            height: screenHeight * 0.028,
                            alignment: AlignmentDirectional.center,
                            decoration: BoxDecoration(
                              color: doneStatusBGColor,
                              borderRadius: BorderRadius.circular(averageScreenSize * 0.02),
                            ),
                            child: Text(
                              'Delivered',
                              style: GoogleFonts.montserrat(
                                color: doneStatusColor,
                                fontSize: averageScreenSize * 0.025,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: averageScreenSize * 0.01),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '\$ 120',
                              style: GoogleFonts.montserrat(
                                color: mainTextColor,
                                fontWeight: FontWeight.w700,
                                fontSize: averageScreenSize * 0.028,
                              ),
                            ),
                            const TextSpan(text: '   '),
                            TextSpan(
                              text: '\$ 150 ',
                              style: GoogleFonts.montserrat(
                                color: dartOptionTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: averageScreenSize * 0.025,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: dartOptionTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: averageScreenSize * 0.02),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Plan Type : ',
                      style: GoogleFonts.montserrat(
                        color: mainTextColor,
                        fontWeight: FontWeight.w700,
                        fontSize: averageScreenSize * 0.025,
                      ),
                    ),
                    TextSpan(
                      text: 'Customised altered days',
                      style: GoogleFonts.montserrat(
                        color: dartOptionTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: averageScreenSize * 0.025,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: averageScreenSize * 0.01),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Start Date : ',
                      style: GoogleFonts.montserrat(
                        color: mainTextColor,
                        fontWeight: FontWeight.w700,
                        fontSize: averageScreenSize * 0.025,
                      ),
                    ),
                    TextSpan(
                      text: 'December 10, 2022',
                      style: GoogleFonts.montserrat(
                        color: dartOptionTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: averageScreenSize * 0.025,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(color: Colors.black12);
      },
    );
  }
}

class DaysTab extends StatelessWidget {
  const DaysTab({super.key, required this.date, required this.dayName, required this.subscriptionBloc});

  final int date;
  final String dayName;
  final SubscriptionBloc subscriptionBloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: subscriptionBloc.getSelectedTab,
      builder: (context, snapshot) {
        return Tab(
          height: screenHeight * 0.09,
          child: Container(
            width: screenWidth * 0.115,
            constraints: BoxConstraints(minHeight: screenHeight * 0.05),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(averageScreenSize * 0.05),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '$date',
                  style: GoogleFonts.montserrat(
                    color: snapshot.data == (date - 1) ? selectedTextColor : mainTextColor,
                    fontSize: averageScreenSize * 0.03,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  dayName,
                  style: GoogleFonts.montserrat(
                    color: snapshot.data == (date - 1) ? selectedTextColor : optionTextColor,
                    fontSize: averageScreenSize * 0.022,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
