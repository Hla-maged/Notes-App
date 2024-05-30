part of 'add_notes_cubit.dart';
@immutable
abstract class NotesState {}
class NotesInitial extends NotesState {}

class NotesSuccess extends NotesState {
}

class NotesFailure extends NotesState {
  final String e;
  NotesFailure(this.e);
}

class Notesloading extends NotesState {}
