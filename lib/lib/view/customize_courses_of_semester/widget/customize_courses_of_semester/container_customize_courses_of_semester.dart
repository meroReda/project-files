import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/colors_app.dart';
import 'package:smart_assistant_app/core/theme/padding_app.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import 'package:smart_assistant_app/model/course_model.dart';
import '../../../../view_model/customize_courses_of_semester/customize_courses_cubit.dart';

class ContainerCustomizeCoursesOfSemester extends StatelessWidget {
  final CourseModel? courseModel;
  final int? index;
  const ContainerCustomizeCoursesOfSemester({super.key ,  this.courseModel , this.index});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final cubit = context.read<CustomizeCoursesCubit>();
    return Padding(
      padding: PaddingApp.getHorVer(0,8),
      child: Container(
         height:  media.height*.12,
         width: media.width,
         decoration: BoxDecoration(
          color: const Color(0xFFffffff),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.3 , color: Colors.grey),
         ),
        child: Padding(
          padding: PaddingApp.getHorVer(10,5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getHeight(5),
                  GestureDetector(
                    onTap: () {
                     index == null ? null :  cubit.toggleCourseSelection(index!);
                    },
                    child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color:  courseModel!.isSelected ? const Color(0xFF7d67f7) : Colors.white,
                      border: Border.all(width: 0.5 , color: Colors.grey)
                    ),
                    child: courseModel!.isSelected ? const Icon(Icons.check , color: Colors.white,)  : const SizedBox.shrink(),
                  ),
                  )
                ],
              ),
              getWidth(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 getHeight(5),
                 Text(courseModel!.name , style: TextStyleApp.font9Black,),
                 Text(courseModel!.code , style: TextStyleApp.font8Grey,),
                 Row(
                  children: [
                    const Icon(Icons.person,color: Colors.green , size: 14,),
                    getWidth(5),
                    Text(courseModel!.doctorName == null || courseModel!.doctorName!.isEmpty ? 'زينب احمد' : courseModel!.doctorName! , style: TextStyleApp.font8Black, )
                  ],
                 ),
                 Row(
                  children: [
                     Icon(Icons.timer,color: ColorsApp.primaryColor , size: 14,),
                    getWidth(5),
                    Text('الأحد والثلاثاء 10:00 إلى 12:00', style: TextStyleApp.font7Black, )
                  ],
                 ),
                 
                ],
              )
                ],
              ),
      
              Container(
                height: media.height *.05,
                width: media.width *.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: const Color(0xFFeff6ff),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(courseModel!.unit , style: TextStyleApp.font8Blue,),
                    getWidth(10),
                    const Icon(Icons.computer , size: 14 , color: Colors.blue,)
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}