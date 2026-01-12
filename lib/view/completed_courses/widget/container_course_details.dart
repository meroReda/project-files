import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/box_decoration_app.dart';
import 'package:smart_assistant_app/core/theme/padding_app.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import 'package:smart_assistant_app/model/course_model.dart';
import 'package:smart_assistant_app/view_model/completed_courses/completed_courses_cubit.dart';
import 'package:smart_assistant_app/view_model/completed_courses/completed_courses_state.dart';

class ContainerCourseDetails extends StatelessWidget {
  final CourseModel courseModel;
  const ContainerCourseDetails({super.key, required this.courseModel});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return BlocBuilder<CompletedCoursesCubit, CompletedCoursesState>(
      builder: (context, state) {
        bool selected = state.selectedCourses!.contains(courseModel);
        return Padding(
          padding: PaddingApp.ver5,
          child: Container(
            height: media.height * .12,
            decoration: BoxDecorationApp.whiteRaduis8BorderAllWidth03ColorGrey
                .copyWith(color: selected ? Colors.blue : Colors.white),
            child: Padding(
              padding: PaddingApp.getOnlyPadding(5, 5, 15, 0),
              child: Column(
                children: [
                  RowNameCourseAndCodeNameAndIconClose(
                      courseModel: courseModel, selected: selected),
                  getHeight(10),
                  RowNameDoctorAndNameSessonAndUnits(courseModel: courseModel, selected: selected),
                  getHeight(10),
                  const Divider(
                    height: 0.5,
                    color: Color.fromARGB(255, 240, 238, 238),
                  ),
                  getHeight(5),
                  RowRequsetCourse(selected: selected, courseModel: courseModel),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class RowRequsetCourse extends StatelessWidget {
  const RowRequsetCourse({
    super.key,
    required this.selected,
    required this.courseModel,
  });

  final bool selected;
  final CourseModel courseModel;
  //
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.library_books_outlined,
          size: 12,
          color: selected ? Colors.white : Colors.black,
        ),
        getWidth(10),
        Text(
          'المتطلبات : ',
          style: TextStyleApp.font7Black.copyWith(
              color: selected
                  ? Colors.white
                  : const Color.fromARGB(255, 145, 136, 136)),
        ),
        courseModel.request.isEmpty
            ? Text(
                'لا يوجد',
                style: TextStyleApp.font7Black.copyWith(
                    color: selected
                        ? Colors.white
                        : const Color.fromARGB(255, 145, 136, 136)),
              )
            : Row(
                children: courseModel.request.map((name) {
                  return Text('$name , ',
                      style: TextStyleApp.font7Black.copyWith(
                        color: selected ? Colors.white : Colors.blue,
                      ));
                }).toList(), // تأكد من تحويل النتيجة إلى قائمة
              ),
      ],
    );
  }
}

class RowNameDoctorAndNameSessonAndUnits extends StatelessWidget {
  const RowNameDoctorAndNameSessonAndUnits({
    super.key,
    required this.courseModel,
    required this.selected,
  });

  final CourseModel courseModel;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'د. ${courseModel.doctorName}',
          style: TextStyleApp.font8Black.copyWith(
              color: selected
                  ? Colors.white
                  : const Color.fromARGB(255, 145, 136, 136)),
        ),
        getWidth(10),
        Container(
          height: 3,
          width: 3,
          decoration:
              const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
        ),
        getWidth(10),
        Text(
          courseModel.sessonName,
          style: TextStyleApp.font8Black.copyWith(
              color: selected
                  ? Colors.white
                  : const Color.fromARGB(255, 145, 136, 136)),
        ),
        getWidth(10),
        Container(
          height: 3,
          width: 3,
          decoration:
              const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
        ),
        getWidth(10),
        Text(
          '${courseModel.unit} ساعات',
          style: TextStyleApp.font8Black.copyWith(
              color: selected
                  ? Colors.white
                  : const Color.fromARGB(255, 145, 136, 136)),
        )
      ],
    );
  }
}

class RowNameCourseAndCodeNameAndIconClose extends StatelessWidget {
  const RowNameCourseAndCodeNameAndIconClose({
    super.key,
    required this.courseModel,
    required this.selected,
  });

  final CourseModel courseModel;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          courseModel.name,
          style: TextStyleApp.font9Black.copyWith(
              fontWeight: FontWeight.w500,
              color: selected ? Colors.white : Colors.black),
        ),
        getWidth(3),
        Text(
          '(${courseModel.code})',
          style: TextStyleApp.font8Grey
              .copyWith(color: selected ? Colors.white : Colors.grey),
        ),
      ],
    );
  }
}
