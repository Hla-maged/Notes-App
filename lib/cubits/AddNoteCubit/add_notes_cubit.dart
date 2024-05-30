import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';

part 'add_notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
 
  NotesCubit() : super(NotesInitial());
   Color color = Color(0xff718355);
  addNote(NoteModel note) async {
    note.color = color.value;
    emit(Notesloading());
    try {
      // receive note >> define notesBox"by open box" that i will add note in it >> add note
      var notesBox = Hive.box<NoteModel>(KNotesBox);
      await notesBox.add(note);
      emit(NotesSuccess());
    } catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }
}
