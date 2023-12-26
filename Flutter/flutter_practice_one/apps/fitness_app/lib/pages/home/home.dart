import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';
import 'package:flutter_practice_one/data/models/user_model.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:flutter_practice_one/widgets/app_bar.dart';
import 'package:flutter_practice_one/widgets/card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FAAppBar(
        user: user1,
        controller: searchController,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FACard(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.titleGoal,
                  style: AppTextStyles.headlineLarge.copyWith(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
