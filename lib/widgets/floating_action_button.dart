import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_profissionais_webview/pages/menu_screen.dart';
import 'package:app_profissionais_webview/widgets/theme.dart';

class FloatingAction extends StatelessWidget {
  const FloatingAction({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: tealColor,
      child: Text(
        "Menu",
        style: whiteTextStyle.copyWith(
          fontSize: 12,
        ),
      ),
      onPressed: () async {
        Get.offAll(() => const MenuScreen());
      },
    );
  }
}
