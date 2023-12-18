import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/color/app_color.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';
import 'package:flutter_practice_one/data/models/welcome_data.dart';
import 'package:flutter_practice_one/pages/auth/login.dart';
import 'package:flutter_practice_one/widgets/image_filter.dart';
import 'package:flutter_practice_one/widgets/rich_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  /// Define two variables for page index and page controller
  int _pageIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            onPageChanged: (value) {
              _pageIndex = value;
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
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      // ignore: inference_failure_on_instance_creation
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text(
                    'SKIP',
                    style: AppTextStyles.textBottom,
                  ),
                ),
                const Spacer(),
                ...List.generate(listWelcomes.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    //if _pageIndex == index, width = 15, else width = 8
                    width: _pageIndex == index ? 15 : 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      //if _pageIndex == index, color = primary
                      //else color = tertiary
                      color: _pageIndex == index
                          ? AppColor.primary
                          : AppColor.tertiary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    //if _pageIndex < listWelcomes.length - 1 then next page
                    //else: page is the last page, navigate to login page
                    if (_pageIndex < listWelcomes.length - 1) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.bounceIn,
                      );
                    } else {
                      Navigator.pushAndRemoveUntil(
                        context,
                        // ignore: inference_failure_on_instance_creation
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                  child: Text(
                    'NEXT',
                    style: AppTextStyles.textBottom,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
