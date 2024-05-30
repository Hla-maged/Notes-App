import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubits/AddNoteCubit/add_notes_cubit.dart';

class ColorItem extends StatelessWidget {
  final bool picked ;
  final Color color;
  ColorItem({required this.picked, required this.color});
  @override
  Widget build(BuildContext context) {
    return picked
        ? CircleAvatar(
            child: Icon(
              Icons.check,
              color: Colors.black,
            ),
            backgroundColor: color,
            radius: 27,
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 27,
          );
  }
}

class ListColors extends StatefulWidget {
  @override
  State<ListColors> createState() => _ListColorsState();
}

class _ListColorsState extends State<ListColors> {
  
  int ind = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          itemCount: Kcolors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () {
                  ind = index;
                  BlocProvider.of<NotesCubit>(context).color =
                      Kcolors[index];
                  setState(() {});
                },
                child: ColorItem(
                  color: Kcolors[index],
                  picked: ind == index,
                ),
              ),
            );
          }),
    );
  }
}
