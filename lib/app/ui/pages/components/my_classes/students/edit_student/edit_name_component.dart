import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/entities/student_entity.dart';
import 'package:class_manager/app/interactors/stores/student_store.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditNameComponent extends StatefulWidget {
  final Student student;
  final Discipline discipline;
  final SchoolClass schoolClass;
  EditNameComponent({
    super.key,
    required this.student,
    required this.discipline,
    required this.schoolClass,
  });

  @override
  State<EditNameComponent> createState() => _EditNameComponentState();
}

class _EditNameComponentState extends State<EditNameComponent> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: widget.student.name);

    validateForm() async {
      Student editedStudent = widget.student;

      if (nameController.text.isNotEmpty && nameController.text.length > 2) {
        editedStudent.name = nameController.text.toUpperCase();
        await context.read<StudentStore>().editStudent(
            editedStudent: editedStudent,
            oldStudent: widget.student,
            schoolClass: widget.schoolClass,
            discipline: widget.discipline);
      }
    }

    return Card(
      elevation: 5,
      color: MyColors().paletteColor3,
      shadowColor: Colors.white,
      surfaceTintColor: Colors.black,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: MyColors().titleColor)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: TextFormField(
          onFieldSubmitted: (value) {
            validateForm();
            FocusScope.of(context).unfocus();
          },
          onEditingComplete: () => validateForm(),
          onSaved: (newValue) => validateForm(),
          showCursor: true,
          controller: nameController,
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          onChanged: (value) => nameController.value =
              TextEditingValue(text: value.toUpperCase()),
          cursorColor: Colors.white,
          style: const TextStyle(
              decorationStyle: TextDecorationStyle.solid,
              decorationColor: Color.fromARGB(255, 233, 219, 219),
              color: Colors.white,
              fontSize: 15,
              wordSpacing: 2),
          decoration: InputDecoration(
              alignLabelWithHint: true,
              labelText: 'Editar Nome',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MyColors().titleColor,
                  ),
                  borderRadius: BorderRadius.circular(12)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MyColors().titleColor,
                  ),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MyColors().titleColor,
                  ),
                  borderRadius: BorderRadius.circular(12)),
              fillColor: MyColors().titleColor,
              floatingLabelStyle: TextStyle(
                color: MyColors().titleColor,
              )),
          autofocus: false,
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }
}
