import 'package:class_manager/app/packages/notes_pct/interactors/note_entity.dart';
import 'package:class_manager/app/packages/notes_pct/interactors/note_states.dart';
import 'package:class_manager/app/packages/notes_pct/interactors/note_store.dart';
import 'package:class_manager/app/packages/notes_pct/ui/dialogs/add_note_dialog.dart';
import 'package:class_manager/app/packages/notes_pct/ui/notes_list_widget.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Note> notesList = [];
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        context.read<NotesStore>().getNotesList().first;
        context.read<NotesStore>().notesStream.listen(
          (event) {
            if (event is Loaded) {
              notesList = event.notesList;
            }
          },
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();

    // context.read<NotesStore>().dispose();
  }

  @override
  Widget build(BuildContext context) {
    NotesStore store = context.watch<NotesStore>();
    final double heigth = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SizedBox.expand(
        child: Card(
          elevation: 15,
          child: DecoratedBox(
            decoration: BoxDecoration(gradient: MyColors().gradientHomePage()),
            child: SingleChildScrollView(
              child: SizedBox(
                height: heigth * .85,
                width: width * .98,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            gradient: MyColors().gradientHomePage()),
                        child: SizedBox.expand(
                            child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Card(
                              color: Colors.black.withOpacity(.2),
                              elevation: 20,
                              child: SizedBox(
                                height: 80,
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    'ANOTAÇÕES',
                                    style: TextStyle(
                                        color: MyColors().titleColor,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                      ),
                    ),
                    const Divider(),
                    Flexible(
                      flex: 12,
                      child: StreamBuilder(
                        stream: store.notesStream,
                        builder: (context, snapshot) {
                          late Widget child;
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: SizedBox(
                                    child: CircularProgressIndicator()));
                          } else if (snapshot.hasError) {
                            child = const Center(
                                child: SizedBox(
                                    child: Text(
                                        'Algo deu errado. Tente novamente mais tarde.')));
                          } else if (snapshot.hasData) {
                            NotesListStates? state = snapshot.data;

                            if (state is Empty) {
                              child = Container();
                            }
                            if (state is Error) {
                              child = Center(
                                  child: SizedBox(child: Text(state.message)));
                            }

                            if (state is Loaded) {
                              child = SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .65,
                                  width: MediaQuery.of(context).size.width * .9,
                                  child: NotesListWidget(
                                    list: state.notesList,
                                    store: store,
                                  ));
                            }
                          }
                          return child;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 20),
                      child: FloatingActionButton(
                        onPressed: () async {
                          await addNoteDialog(context, store);
                        },
                        backgroundColor: MyColors().paletteColor2,
                        elevation: 20,
                        foregroundColor: MyColors().paletteColor1,
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
