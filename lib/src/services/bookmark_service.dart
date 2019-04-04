import 'dart:async';

import 'package:angular/angular.dart';
import 'package:firebase/firebase.dart';

import '../model/bookmark.dart';

@Injectable()
class BookmarkService {
  BookmarkService() {
    initializeApp(
      apiKey: "AIzaSyDz0_Z9cSleynEWUD0Xtx_kLDguxbrRjAU",
      authDomain: "bookmark-manager-1e87a.firebaseapp.com",
      databaseURL: "https://bookmark-manager-1e87a.firebaseio.com",
      projectId: "bookmark-manager-1e87a",
      storageBucket: "bookmark-manager-1e87a.appspot.com",
      messagingSenderId: "666842763609",
    );

    _db = database();
    _ref = _db.ref('bookmarks').ref;
  }

  Database _db;
  DatabaseReference _ref;

  Future<List<Bookmark>> getBookmarks() async {
    final List<Bookmark> bookmarks = [];
    final queryEvent = await _ref.once('value');
    final DataSnapshot snapshot = queryEvent.snapshot;
    final bmData = snapshot.val();

    bmData.forEach((key, val) {
      var details = val as Map<String, dynamic>;
      details['id'] = key;
      bookmarks.add(Bookmark.fromMap(details));
    });

    return bookmarks;
  }

  Future addBookmark(Bookmark bm) async {
    var res = await _ref.push(bm.asMap());
    return res.key;
  }

  Future updateBookmark(Bookmark bm) async {
    return await _ref.child(bm.id).set(bm.asMap());
  }

  Future removeBookmark(Bookmark bm) async {
    return await _ref.child(bm.id).remove();
  }
}
