import 'package:calories_fix/ui/intro_flow/first_view/widgets/image_section.dart';
import 'package:calories_fix/ui/intro_flow/first_view/widgets/text_and_button_section.dart';
import 'package:flutter/material.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: LangAndTheme(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageSection(),
              TextAndButtonSection(),
            ],
          ),
        ),
      ),
    );
  }
}
