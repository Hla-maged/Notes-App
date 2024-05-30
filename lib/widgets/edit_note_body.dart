import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/ViewNoteCubit/view_notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/AppBar.dart';
import 'package:note_app/widgets/Text_feild.dart';
import 'package:note_app/widgets/edit_note_colors.dart';

class EditNoteBody extends StatefulWidget {
  const EditNoteBody({required this.note});

  final NoteModel note;
  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          AppBarW(
            onPressed: () {
              widget.note.title = title ??
                  widget.note.title; // if not changed take the old value
              widget.note.subTitle = subTitle ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<ViewNoteCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: "Edit Note",
            icon: Icons.check,
          ),
          SizedBox(
            height: 30,
          ),
          CustomTextField(
              onChanged: (value) {
                title = value;
              },
              hint: widget.note.title),
          SizedBox(
            height: 30,
          ),
          CustomTextField(
            onChanged: (value) {
              subTitle = value;
            },
            hint: widget.note.subTitle,
            maxLines: 6,
          ),
          SizedBox(
            height: 30,
          ),
          EditNoteColorsList(note: widget.note)
        ],
      ),
    );
  }
}
