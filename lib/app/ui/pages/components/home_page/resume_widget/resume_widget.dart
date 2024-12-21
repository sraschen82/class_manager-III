import 'package:class_manager/app/ui/pages/components/home_page/resume_widget/my_classes_resume.dart';
import 'package:class_manager/app/ui/pages/components/home_page/resume_widget/notes_resume.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';

class ResumeWidget extends StatefulWidget {
  const ResumeWidget({super.key});

  @override
  State<ResumeWidget> createState() => _ResumeWidgetState();
}

class _ResumeWidgetState extends State<ResumeWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height * .67,
      width: width * .96,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.fromBorderSide(
                          BorderSide(color: MyColors().titleColor)),
                      borderRadius: BorderRadius.circular(12),
                      gradient: MyColors().gradientHomePage()),
                  child: SizedBox(
                    height: height * .32,
                    width: width * .45,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text('Minhas Turmas'),
                        ),
                        MyClassesResume()
                      ],
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.fromBorderSide(
                          BorderSide(color: MyColors().titleColor)),
                      borderRadius: BorderRadius.circular(12),
                      gradient: MyColors().gradientHomePage()),
                  child: SizedBox(
                    height: height * .32,
                    width: width * .45,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text('Anotações'),
                        ),
                        NotesResume()
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.fromBorderSide(
                          BorderSide(color: MyColors().titleColor)),
                      borderRadius: BorderRadius.circular(12),
                      gradient: MyColors().gradientHomePage()),
                  child: SizedBox(
                    height: height * .32,
                    width: width * .45,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text('Reavaliações'),
                        ),
                        // ListView.builder(itemBuilder: itemBuilder)
                      ],
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.fromBorderSide(
                          BorderSide(color: MyColors().titleColor)),
                      borderRadius: BorderRadius.circular(12),
                      gradient: MyColors().gradientHomePage()),
                  child: SizedBox(
                    height: height * .32,
                    width: width * .45,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text('Estatísticas'),
                        ),
                        // ListView.builder(itemBuilder: itemBuilder)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
