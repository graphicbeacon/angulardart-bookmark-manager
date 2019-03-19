import 'package:angular/angular.dart';

@Component(
    selector: 'bm-scaffold',
    templateUrl: 'bm_scaffold_component.html',
    directives: [coreDirectives])
class BookmarkScaffoldComponent {
  final List bookmarks = [
    {
      'title': 'Creative Bracket',
      'description':
          'Go-to Dart blog containing Dart resources for beginners and beyond',
      'url': 'https://creativebracket.com',
    },
    {
      'title': 'Dartlang Home',
      'description': 'Documentation website for the Dart language and tools',
      'url': 'https://dartlang.org',
    },
    {
      'title': 'Flutter',
      'description': 'Build native mobile apps with the Flutter SDK',
      'url': 'https://flutter.io',
    }
  ];

  removeBookmark(int index) {
    bookmarks.removeAt(index);
  }
}
