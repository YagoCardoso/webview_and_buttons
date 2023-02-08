// ignore_for_file: must_be_immutable

import 'package:app_profissionais_webview/widgets/theme.dart';
import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  String label;
  String icon;
  VoidCallback onTap;

  SquareButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: whiteColor,
              border: Border.all(color: greyColor)),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            onPressed: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  icon,
                  width: 45,
                ),
                const SizedBox(
                  height: 7,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.28,
          child: Text(
            label,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
