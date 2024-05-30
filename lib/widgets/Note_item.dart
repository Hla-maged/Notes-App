import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/cubits/ViewNoteCubit/view_notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/pages/edit_page.dart';

class NoteItem extends StatelessWidget {
  final NoteModel note;
  NoteItem({required this.note});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNote(
            note: note,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          decoration: BoxDecoration(
              color: Color(note.color),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(note.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22)),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(note.subTitle,
                      style: TextStyle(
                          color: Colors.black.withOpacity(.5), fontSize: 18)),
                ),
                trailing: IconButton(
                    onPressed: () {
                      note.delete();
                      BlocProvider.of<ViewNoteCubit>(context).fetchAllNotes();
                    },
                    icon: Icon(
                      FontAwesomeIcons.trash,
                      size: 22,
                      color: Colors.black,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  note.date,
                  style: TextStyle(
                      color: Colors.black.withOpacity(.5), fontSize: 14),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
