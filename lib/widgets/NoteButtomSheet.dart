import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/AddNoteCubit/add_notes_cubit.dart';
import 'package:note_app/cubits/ViewNoteCubit/view_notes_cubit.dart';
import 'package:note_app/widgets/add_note_form.dart';

class NoteButtomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Bloclistener listen to some states and make a change but the BlocBuilder rebuild the ui again so we don't need it here
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: BlocConsumer<NotesCubit, NotesState>(
        listener: (context, state) {
          if (state is NotesFailure) {
            print(state.e);
          }
          if (state is NotesSuccess) {
            Navigator.pop(context);
            BlocProvider.of<ViewNoteCubit>(context).fetchAllNotes();
          }
        },
        builder: (context, state) {
          //AbsorbPointer=> forbiden you from dealing with anything in buttomSheet while its bool value is true"while loading"
          return AbsorbPointer(
            absorbing: state is Notesloading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  // to make the buttomSheet take extra height of my keyboard while typing ,"MediaQuery" give me an access to my device
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(child: AddNote()),
            ),
          );
        },
      ),
    );
  }
}
