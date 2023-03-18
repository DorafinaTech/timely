import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:timely/controllers/base_controller.dart';
import 'package:timely/models/notemodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:timely/utilities/show_error_snackbar.dart';
import 'package:timely/utilities/show_snackbar.dart';
import 'package:firebase_storage/firebase_storage.dart';

class NoteController extends BaseController {
  @override
  String get collectionName => 'notes';

  Future<void> deleteNote(NotesModel note) async {
    try {
      var response = await FirebaseFirestore.instance
          .collection(collectionName)
          .where('title', isEqualTo: note.title)
          .where('userID', isEqualTo: note.userID)
          .limit(1)
          .orderBy('time')
          .get();

      var docID = response.docs[0].id;

      await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(docID)
          .delete();
    } catch (e) {
      debugPrint(e.toString());
      showErrorSnackbar(
          'Unable o delete note at this time.\nPlease check your internet connection, or close the app and reopen');
    }
  }

  Future<void> addNewNote(String title, String body) async {
    try {
      var note = NotesModel(
          userID: FirebaseAuth.instance.currentUser!.uid,
          time: DateTime.now(),
          title: title,
          body: body);

      await FirebaseFirestore.instance
          .collection(collectionName)
          .add(note.toJson());

      showSnackbar('Hurray', 'Your note has been saved');
    } catch (exception) {
      showErrorSnackbar(
          'An error occurred while trying to save your note: $exception');
    }
  }

  Future<void> updateNote(String title, String body) async {
    try {
      var note = NotesModel(
          userID: FirebaseAuth.instance.currentUser!.uid,
          time: DateTime.now(),
          title: title,
          body: body);

      await FirebaseFirestore.instance.collection('notes').add(note.toJson());

      showSnackbar('Hurray', 'Your note has been saved');
    } catch (exception) {
      showErrorSnackbar(
          'An error occurred while trying to save your note: $exception');
    }
  }

  Stream<QuerySnapshot> getSnapshots() {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .orderBy('time', descending: true)
        .snapshots();
  }
}
