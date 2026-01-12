import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import '../../../core/theme/text_style_app.dart';

class ContainerContinueStudent extends StatelessWidget {
  const ContainerContinueStudent({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      height: media.height * .12,
      width: media.width,
      decoration: BoxDecoration(
        color: const Color(0xFFfaa61f),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle
                ),
                child: const Icon(Icons.contact_support_outlined , color: Colors.white,),
              ),
              getWidth(15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getHeight(10),
                    Text(
                      'نصيحة اليوم!', 
                      style: TextStyleApp.font12White.copyWith(fontWeight: FontWeight.w500),
                      maxLines: 1,
                    ),
                    Text(
                      'خصص 25 دقيقة للدراسة المركزة ثم استرح 5 دقائق. هذه الطريقة تساعدك على التركيز بشكل أفضل!', 
                      style: TextStyleApp.font7White.copyWith(fontWeight: FontWeight.bold), 
                      textAlign: TextAlign.start, 
                      maxLines: 3, 
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}