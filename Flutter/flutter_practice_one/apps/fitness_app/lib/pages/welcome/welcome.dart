import 'package:fitness_ui/components/carousel.dart';
import 'package:fitness_ui/components/image_filter.dart';
import 'package:fitness_ui/components/rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/data/models/welcome_data.dart';
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
            itemCount: listWelcomes.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  FAImageFilter(
                    image: listWelcomes[index].backgroundImage ?? '',
                  ),
                  Positioned.fill(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(listWelcomes[index].image ?? ''),
                        const SizedBox(height: 42),
                        FARichText(
                          fistText: listWelcomes[index].firstText,
                          secondText: listWelcomes[index].secondText,
                          thirdText: listWelcomes[index].thirdText,
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
              onPressedSkip: () => GoRouter.of(context).go('/loginScreen'),
              onPressedNext: () {
                //if pageIndex < listWelcomes.length - 1 then next page
                //else: page is the last page, navigate to login page
                if (pageIndex < listWelcomes.length - 1) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.bounceIn,
                  );
                } else {
                  GoRouter.of(context).go('/loginScreen');
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
