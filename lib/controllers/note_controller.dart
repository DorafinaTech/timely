import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timely/controllers/base_controller.dart';
import 'package:timely/models/notemodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:timely/utilities/show_error_snackbar.dart';
import 'package:timely/utilities/show_snackbar.dart';

class NoteController extends BaseController {
  Future<void> addNewNote(String title, String body) async {
    try {
      var note = NotesModel(
          userID: FirebaseAuth.instance.currentUser!.uid,
          time: DateTime.now(),
          title: title,
          body: body);

      await FirebaseFirestore.instance
          .collection('notes')
          .add(note.toJson());

      showSnackbar('Hurray', 'Your note has been saved');
    } catch (exception) {
      showErrorSnackbar('An error occurred while trying to save your note: $exception');
    }
  }
  Future<void> updateNote(String title, String body) async {
    try {
      var note = NotesModel(
          userID: FirebaseAuth.instance.currentUser!.uid,
          time: DateTime.now(),
          title: title,
          body: body);

      await FirebaseFirestore.instance
          .collection('notes')
          .add(note.toJson());

      showSnackbar('Hurray', 'Your note has been saved');
    } catch (exception) {
      showErrorSnackbar('An error occurred while trying to save your note: $exception');
    }
  }
}
