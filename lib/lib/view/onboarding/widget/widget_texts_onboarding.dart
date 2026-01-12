import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/theme/padding_app.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import 'package:smart_assistant_app/model/onboarding_model.dart';

class WidgetTextsOnboarding extends StatelessWidget {
  final OnboardingModel onboardingModel;
  const WidgetTextsOnboarding({super.key, required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingApp.hor15,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                onboardingModel.title,
                style: TextStyleApp.font14Black,
                textAlign: TextAlign.right,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  onboardingModel.subTitle,
                  style: TextStyleApp.font10Black,
                  
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
