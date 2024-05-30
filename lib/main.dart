import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/bloc_observer.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubits/AddNoteCubit/add_notes_cubit.dart';
import 'package:note_app/cubits/ViewNoteCubit/view_notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = MyBlocObserver();
  Hive.registerAdapter(
      NoteModelAdapter()); // means that we tell hive that she deals with note model
  await Hive.openBox<NoteModel>(
      KNotesBox); // open the box that i will save data with

  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewNoteCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: "Poppins"),
        home: HomePage(),
      ),
    );
  }
}
