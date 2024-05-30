import 'package:flutter/material.dart';
import 'package:note_app/widgets/HomeBody.dart';
import 'package:note_app/widgets/NoteButtomSheet.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 148, 204, 177),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              context: context,
              builder: (context) {
                return NoteButtomSheet();
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: HomeBody(),
    );
  }
}
