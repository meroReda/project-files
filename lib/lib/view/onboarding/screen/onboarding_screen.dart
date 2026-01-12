import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/colors_app.dart';
import 'package:smart_assistant_app/view/onboarding/widget/widget_buttons_onboarding.dart';
import 'package:smart_assistant_app/view/onboarding/widget/widget_row_circle_container.dart';
import 'package:smart_assistant_app/view/onboarding/widget/widget_texts_onboarding.dart';
import 'package:smart_assistant_app/view_model/onbording/onboarding_data.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController controllerPage;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();

    controllerPage = PageController();
    controllerPage.addListener(() {
      setState(() {
        selectedIndex = controllerPage.page!.round();
      });
    });
  }

  @override
  void dispose() {
    controllerPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsApp.whiteColor,
      body: Column(
        children: [
         SizedBox(
           
            height: media.height *.8,
            child: PageView(
              controller: controllerPage,
              children: OnboardingData.onboardingModel.map(
                (item) {
                  return Column(
                    children: [
                      getHeight(50),
                      Image.asset(item.image,height: media.height * .35, width: media.width),
                      WidgetTextsOnboarding(onboardingModel: item),
                      const Spacer(),
                      WidgetRowCircleContainer(selectedIndex: selectedIndex,),
                    ],
                  );
                },
              ).toList(),
            ),
          ),
          Expanded(
            child: WidgetButtonsOnboarding(
                      selectedIndex: selectedIndex,
                    ),
          )
        ],
      ),
      
    );
  }
}
