import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_profissionais_webview/pages/comissoes_screen.dart';
import 'package:app_profissionais_webview/pages/consulta2_screen.dart';
import 'package:app_profissionais_webview/pages/consulta3_screen.dart';
import 'package:app_profissionais_webview/pages/consulta4_screen.dart';
import 'package:app_profissionais_webview/pages/consulta5_screen.dart';
import 'package:app_profissionais_webview/pages/consulta6_screen.dart';
import 'package:app_profissionais_webview/widgets/square_button.dart';
import 'package:app_profissionais_webview/widgets/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    repeatOnce();
  }

  void repeatOnce() async {
    await _controller.forward();
  }

  @override
  void dispose() {
    _controller.isAnimating;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final List<String> imgList = [
    //   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    //   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    //   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    //   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    //   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    //   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    // ];

    Widget banner() {
      return Container(
        height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
          color: primaryColor,
        ),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: blackColor.withOpacity(0.4),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    height: 210,
                    child: Image.asset(
                      "assets/images/logo_yago_dev.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    "Titulo do App",
                    style: whiteTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: medium,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  // ElevatedButton(
                  //     onPressed: () {},
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: redColor,
                  //     ),
                  //     child: Text(
                  //       "Testar ação",
                  //       style: whiteTextStyle,
                  //     ))
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget menu() {
      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background_menu5.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Dashboard",
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Wrap(
                    runSpacing: 7,
                    children: [
                      SquareButton(
                        label: "Comissões",
                        onTap: () => Get.to(() => const ComissoesScreen()),
                        icon: "assets/icons/icon_consulta1.png",
                      ),
                      SquareButton(
                        label: "Consulta 2",
                        onTap: () => Get.to(() => const Consulta2()),
                        icon: "assets/icons/icon_consulta2.png",
                      ),
                      SquareButton(
                        label: "Consulta 3",
                        onTap: () => Get.to(() => const Consulta3()),
                        icon: "assets/icons/icon_consulta3.png",
                      ),
                      SquareButton(
                        label: "Consulta 4",
                        onTap: () => Get.to(() => const Consulta4()),
                        icon: "assets/icons/icon_consulta4.png",
                      ),
                      SquareButton(
                        label: "Consulta 5",
                        onTap: () => Get.to(() => const Consulta5()),
                        icon: "assets/icons/icon_consulta5.png",
                      ),
                      SquareButton(
                        label: "Consulta 6",
                        onTap: () => Get.to(() => const Consulta6()),
                        icon: "assets/icons/icon_consulta6.png",
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: blackColor.withOpacity(0.4),
            ),
            child: RichText(
              text: TextSpan(
                  text: "Powered By ",
                  style: whiteTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                  children: [
                    TextSpan(
                        text: "Nome da empresa",
                        style: whiteTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: semiBold,
                        ))
                  ]),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          banner(),
          menu(),
        ],
      ),
    );
  }
}
