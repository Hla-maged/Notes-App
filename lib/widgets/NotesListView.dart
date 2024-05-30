import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/ViewNoteCubit/view_notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/Note_item.dart';

class NotesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewNoteCubit, VNotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<ViewNoteCubit>(context).notes ?? [];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 18),
          child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return NoteItem(note: notes[index]);
              }),
        );
      },
    );
  }
}
