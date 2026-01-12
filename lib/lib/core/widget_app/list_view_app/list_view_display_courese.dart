import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/model/course_model.dart';
import 'package:smart_assistant_app/view_model/completed_courses/completed_courses_cubit.dart';
import '../../../view/completed_courses/widget/container_course_details.dart';

class ListViewDisplayCourses extends StatelessWidget {
  final List<CourseModel> courseModel;
  final VoidCallback ?onTap;
  const ListViewDisplayCourses({
    super.key,
    required this.courseModel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(courseModel.length, (index) {
        return GestureDetector(
          onTap: (){
             context.read<CompletedCoursesCubit>().toggleCourseSelection(courseModel[index]);
          },
          child: ContainerCourseDetails(courseModel: courseModel[index]));
      }).toList(),
    );
  }
}
