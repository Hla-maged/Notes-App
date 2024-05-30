import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/edit_note_body.dart';

class EditNote extends StatelessWidget {
  final NoteModel note;
  EditNote({required this.note});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditNoteBody(
      note: note,
    ));
  }
}

