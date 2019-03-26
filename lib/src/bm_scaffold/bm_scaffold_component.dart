import 'package:angular/angular.dart';

import '../model/bookmark.dart';
import '../bm_form/bm_form_component.dart';

@Component(
  selector: 'bm-scaffold',
  templateUrl: 'bm_scaffold_component.html',
  directives: [
    coreDirectives,
    BookmarkFormComponent,
  ],
)
class BookmarkScaffoldComponent {
  final List bookmarks = [
    Bookmark(
      title: 'Creative Bracket',
      description:
          'Go-to Dart blog containing Dart resources for beginners and beyond',
      url: 'https://creativebracket.com',
      edit: false,
      isFresh: false,
    ),
    Bookmark(
      title: 'Dartlang Home',
      description: 'Documentation website for the Dart language and tools',
      url: 'https://dartlang.org',
      edit: false,
      isFresh: false,
    ),
    Bookmark(
      title: 'Flutter',
      description: 'Build native mobile apps with the Flutter SDK',
      url: 'https://flutter.io',
      edit: false,
      isFresh: false,
    )
  ];

  Bookmark editedBookmark;

  addBookmark() {
    bookmarks.add(Bookmark());
  }

  editBookmark(int index) {
    bookmarks[index].edit = true;
  }

  removeBookmark(int index) {
    bookmarks.removeAt(index);
  }
}
