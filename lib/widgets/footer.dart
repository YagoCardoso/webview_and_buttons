import 'package:flutter/material.dart';
import 'package:app_profissionais_webview/widgets/theme.dart';

class PoweredBy extends StatelessWidget {
  const PoweredBy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: blueColor.withOpacity(0.5),
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
              text: "Powered By ",
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: light,
              ),
              children: [
                TextSpan(
                    text: "Nome da empresa",
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    ))
              ]),
        ),
      ),
    );
  }
}
