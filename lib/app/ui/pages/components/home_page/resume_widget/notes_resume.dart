import 'package:class_manager/app/packages/notes_pct/interactors/note_entity.dart';
import 'package:class_manager/app/packages/notes_pct/interactors/note_store.dart';
import 'package:class_manager/app/ui/extentions/text_ext.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../packages/notes_pct/interactors/note_states.dart';

class NotesResume extends StatefulWidget {
  const NotesResume({super.key});

  @override
  State<NotesResume> createState() => _NotesResumeState();
}

class _NotesResumeState extends State<NotesResume> {
  List<Note> list = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      context.read<NotesStore>().getNotesList().first;
      context.read<NotesStore>().notesStream.listen(
        (event) {
          if (event is Loaded) {
            list.addAll(event.notesList);
          }
        },
      );
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height * .28,
      width: width,
      child: list.length == 0
          ? SizedBox(
              height: 30,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('    Nenhuma anotação adicionada.'),
                  ),
                ),
              ),
            )
          : ListView.builder(
              itemCount: list.length,
              addAutomaticKeepAlives: true,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  horizontalTitleGap: 0,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: MyColors().titleColor)),
                  leading: Text('${index + 1}'),
                  title: Text(
                    '${list[index].title}',
                    maxLines: 1,
                  ),
                  subtitle: Text('${list[index].description}')
                      .removeNullAndEditSize(8),
                );
              },
            ),
    );
  }
}
