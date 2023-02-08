// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:app_profissionais_webview/widgets/theme.dart';

class LongButton extends StatelessWidget {
  String label;
  String icon;
  Color color;
  double iconSize;
  VoidCallback onTap;

  LongButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.icon,
    required this.iconSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white.withOpacity(0.2),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: iconSize,
            ),
            const SizedBox(
              width: 7,
            ),
            Text(
              label,
              style: whiteTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
