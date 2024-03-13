import 'package:fitness_app/core/constant/constant.dart';
import 'package:fitness_app/features/welcome/widget/image_filter.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/carousel.dart';
import 'package:fitness_ui/components/rich_text.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  /// Define two variables for page index and page controller
  int pageIndex = 0;
  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            onPageChanged: (value) {
              pageIndex = value;
              setState(() {});
            },
            itemCount: splashInfos.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  FAImageFilter(
                    image: splashInfos[index].backgroundImage ?? '',
                  ),
                  Positioned.fill(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(splashInfos[index].image ?? ''),
                        context.sizedBox(height: 42),
                        FARichText(
                          fistText: splashInfos[index].firstText,
                          secondText: splashInfos[index].secondText,
                          thirdText: splashInfos[index].thirdText,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 24,
            child: FACarousel(
              onSkip: () => context.go(AppRoutes.loginScreen.path),
              onNext: () {
                //if pageIndex < listWelcomes.length - 1 then next page
                //else: page is the last page, navigate to login page
                if (pageIndex < splashInfos.length - 1) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.bounceIn,
                  );
                } else {
                  context.go(AppRoutes.loginScreen.path);
                }
              },
              pageIndex: pageIndex,
              pageController: pageController,
            ),
          ),
        ],
      ),
    );
  }
}
