import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/ViewNoteCubit/view_notes_cubit.dart';
import 'package:note_app/widgets/AppBar.dart';
import 'package:note_app/widgets/NotesListView.dart';

class HomeBody extends StatefulWidget {
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
    @override
  void initState() {
   BlocProvider.of<ViewNoteCubit>(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          AppBarW(
            
            title: "Notes",icon: Icons.search,),
          Expanded(child: NotesListView())
        ],
      ),
    );
  }
}
