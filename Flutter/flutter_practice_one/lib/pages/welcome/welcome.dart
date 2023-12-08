import 'package:flutter/material.dart';

// Define the WelcomePage widget
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

// Define the state for the WelcomePage widget
class _WelcomePageState extends State<WelcomePage> {

  // Store the current page index
  int pageIndex = 0;

  List<String> listImage = [
    'assets/images/welcome-one.png',
    'assets/images/welcome-two.png',
    'assets/images/welcome-three.png',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: PageView.builder(
        itemCount: 3,
        onPageChanged: (value) {
          pageIndex = value;
          setState(() {});
        },
        itemBuilder: (context, index) {
          return Center(
            child: Column(
              children: [
                Image.asset(
                  height: size.height * 0.5,
                  listImage[index],
                  fit: BoxFit.fitHeight,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
