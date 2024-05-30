import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constants.dart';

import 'package:note_app/models/note_model.dart';

part 'view_notes_state.dart';

class ViewNoteCubit extends Cubit<VNotesState> {
  ViewNoteCubit() : super(VNotesInitial());
  List<NoteModel>? notes;
  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(KNotesBox);
    // give me a list of my notes
    notes = notesBox.values.toList();
    emit(VNotesSuccess());
  }
}
