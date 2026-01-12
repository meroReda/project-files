import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
class UpperBarLogin extends StatelessWidget {
  final String image; 
  const UpperBarLogin({super.key , required this.image});
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      height: media.height * .3,
      width: media.width * .75,
      child: Column(
        children: [
          getHeight(10),
          Image.asset(image, height: media.height *.28),
        ],
      ),
    );
  }
}
