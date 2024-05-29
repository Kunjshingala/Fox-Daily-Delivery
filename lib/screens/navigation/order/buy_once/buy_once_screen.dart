import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fox_daily_delivery/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/colors.dart';
import 'buy_once_bloc.dart';

class BuyOnceScreen extends StatefulWidget {
  const BuyOnceScreen({super.key});

  @override
  State<BuyOnceScreen> createState() => _BuyOnceScreenState();
}

class _BuyOnceScreenState extends State<BuyOnceScreen> {
  late BuyOnceBloc buyOnceBloc;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    buyOnceBloc = BuyOnceBloc(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(vertical: averageScreenSize * 0.01),
      constraints: BoxConstraints(maxWidth: screenWidth),
      child: ListView.separated(
        itemCount: buyOnceBloc.buyOnceList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: averageScreenSize * 0.05,
              vertical: averageScreenSize * 0.01,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '#${buyOnceBloc.buyOnceList[index].id}',
                      style: GoogleFonts.montserrat(
                        color: mainTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: averageScreenSize * 0.028,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/right_icon.svg',
                      color: mainIconColor,
                      width: averageScreenSize * 0.02,
                      height: averageScreenSize * 0.02,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  buyOnceBloc.buyOnceList[index].date,
                  style: GoogleFonts.montserrat(
                    color: dartOptionTextColor,
                    fontWeight: FontWeight.w500,
                    fontSize: averageScreenSize * 0.025,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${buyOnceBloc.buyOnceList[index].quantity} items',
                      style: GoogleFonts.montserrat(
                        color: mainTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: averageScreenSize * 0.028,
                      ),
                    ),
                    Text(
                      '\$${buyOnceBloc.buyOnceList[index].price}',
                      style: GoogleFonts.montserrat(
                        color: mainTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: averageScreenSize * 0.028,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: dividerColor,
          );
        },
      ),
    );
  }
}
