import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/AddNoteCubit/add_notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/CustomButton.dart';
import 'package:note_app/widgets/Text_feild.dart';
import 'package:note_app/widgets/colors_list_view.dart';

class AddNote extends StatefulWidget {
  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode validateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CustomTextField(
            onSaved: (val) {
              title = val;
            },
            hint: 'Title',
          ),
          SizedBox(
            height: 30,
          ),
          CustomTextField(
            onSaved: (val) {
              subTitle = val;
            },
            hint: 'Content',
            maxLines: 6,
          ),
          SizedBox(
            height: 30,
          ),
          ListColors(),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<NotesCubit, NotesState>(
            builder: (context, state) {
              return CustomButton(
                load: state is Notesloading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var Date = DateTime.now();
                    var formatted = DateFormat('dd-mm-yyyy').format(Date);
                    var noteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formatted,
                        color: Colors.yellow.value);
                    BlocProvider.of<NotesCubit>(context).addNote(noteModel);
                  } else {
                    validateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}
