import 'dart:async';

import 'package:class_manager/app/data/data_base/abstract_data_base.dart';
import 'package:class_manager/app/packages/notes_pct/interactors/note_entity.dart';
import 'package:class_manager/app/packages/notes_pct/interactors/note_states.dart';

class NotesStore {
  final DataBase db;

  NotesStore({required this.db});

  final _controller = StreamController<NotesListStates>.broadcast();

  Stream<NotesListStates> get notesStream => _controller.stream;

  Stream<List<Note>> getNotesList() async* {
    NotesListStates state = Empty();
    List<Note> list = [];
    try {
      // await db.getNotesList();

      db.user.notesList.isNotEmpty
          ? {
              list.addAll(db.user.notesList),
              state = Loaded(notesList: list),
            }
          : state = Empty();
    } catch (e) {
      state = Error(message: 'Erro ao carregar as anotações.');
      _controller.add(state);
      await Future.delayed(const Duration(seconds: 3));
      state = Empty();
    }

    _controller.add(state);

    yield list;
  }

  Future<void> saveNote({required Note note}) async {
    NotesListStates state = Empty();
    List<Note> list = [];
    list.addAll(db.user.notesList);
    if (list.any((element) => element.title == note.title)) {
      final int index = list.indexOf(list.firstWhere(
        (element) => element.title == note.title,
      ));

      list.removeWhere((element) => element.title == note.title);
      list.insert(index, note);

      try {
        await db.saveUser(user: db.user.copyWith(notesList: list));

        state = Loaded(notesList: list);
      } catch (e) {
        state = Error(message: 'Erro ao salvar a anotação.');
        _controller.add(state);
        await Future.delayed(const Duration(seconds: 3));
        state = Loaded(notesList: list);
      }
    } else {
      try {
        list.add(note);
        await db.saveUser(
            user: db.user.copyWith(credentials: null, notesList: list));

        state = Loaded(notesList: list);
      } catch (e) {
        state = Error(message: 'Erro ao salvar a anotação.');
        _controller.add(state);
        await Future.delayed(const Duration(seconds: 3));
        state = Loaded(notesList: list);
      }
    }

    _controller.add(state);
  }

  Future<void> saveNoteList({required List<Note> noteList}) async {
    NotesListStates state = Empty();

    try {
      await db.saveUser(
          user: db.user.copyWith(credentials: null, notesList: noteList));

      state = Loaded(notesList: noteList);
    } catch (e) {
      state = Error(message: 'Erro ao salvar a anotação.');
      _controller.add(state);
      await Future.delayed(const Duration(seconds: 3));
      state = Loaded(notesList: noteList);
    }

    _controller.add(state);
  }

  Future<void> deleteNote({required Note note}) async {
    NotesListStates state = Empty();
    List<Note> list = [];
    list.addAll(db.user.notesList);
    try {
      list.remove(note);
      await db.saveUser(
          user: db.user.copyWith(credentials: null, notesList: list));
      state = Loaded(notesList: list);
    } catch (e) {
      state = Error(message: 'Erro ao remover a anotação.');
      _controller.sink.add(state);
      await Future.delayed(const Duration(seconds: 3));
      state = Loaded(notesList: list);
    }

    _controller.sink.add(state);
  }

  void dispose() => _controller.close();
}
