import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';
import '../../../utils/dimens.dart';
import 'order_bloc.dart';

class AppBarMonthDropDown extends StatelessWidget {
  final OrderTabBarBloc orderTabBarBloc;
  const AppBarMonthDropDown({super.key, required this.orderTabBarBloc});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: screenWidth * 0.2, maxHeight: screenHeight * 0.043),
      child: StreamBuilder<int>(
        stream: orderTabBarBloc.getSelectedMonth,
        builder: (context, snapshot) {
          return DropdownButtonFormField(
            isDense: true,
            dropdownColor: secondaryColor,
            value: snapshot.data ?? 1,
            alignment: AlignmentDirectional.center,
            style: GoogleFonts.montserrat(
              color: mainTextColor,
              fontSize: averageScreenSize * 0.01,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsetsDirectional.symmetric(horizontal: averageScreenSize * 0.02),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: optionColor),
                borderRadius: BorderRadius.circular(averageScreenSize * 0.02),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: optionColor),
                borderRadius: BorderRadius.circular(averageScreenSize * 0.02),
              ),
            ),
            icon: SvgPicture.asset(
              'assets/icons/drop_down_icon.svg',
              color: secondaryIconColor,
            ),
            onChanged: (value) {
              debugPrint('-------------------------->${value.runtimeType}');

              /// set month in stream.
              orderTabBarBloc.setSelectedMonth(value as int);
              debugPrint('-------------------------->${orderTabBarBloc.selectedMonthSubject.value}');

              /// get days of selected month.

              orderTabBarBloc.getDaysInMonth(
                  orderTabBarBloc.selectedMonthSubject.value, orderTabBarBloc.year);

              debugPrint('-------------------------->${orderTabBarBloc.daysInSelectedMonthSubject.value}');
            },
            items: orderTabBarBloc.mothList.map(
              (item) {
                return DropdownMenuItem(
                  value: item['id'],
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    item["value"].toString(),
                    style: GoogleFonts.montserrat(
                      color: mainTextColor,
                      fontSize: averageScreenSize * 0.025,
                    ),
                  ),
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
