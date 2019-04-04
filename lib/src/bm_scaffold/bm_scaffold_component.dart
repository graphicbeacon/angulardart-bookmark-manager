import 'package:angular/angular.dart';

import '../model/bookmark.dart';
import '../bm_form/bm_form_component.dart';
import '../services/bookmark_service.dart';

@Component(
    selector: 'bm-scaffold',
    templateUrl: 'bm_scaffold_component.html',
    directives: [
      coreDirectives,
      BookmarkFormComponent,
    ],
    providers: [
      ClassProvider(BookmarkService)
    ])
class BookmarkScaffoldComponent implements OnInit {
  BookmarkScaffoldComponent(this._bmService);

  final BookmarkService _bmService;
  List bookmarks = [];
  bool isLoading = true;

  Bookmark editedBookmark;

  @override
  Future<Null> ngOnInit() async {
    bookmarks = await _bmService.getBookmarks();
    isLoading = false;
  }

  addBookmark() {
    bookmarks.add(Bookmark());
  }

  editBookmark(int index) {
    bookmarks[index].edit = true;
  }

  removeBookmark(int index) async {
    await _bmService.removeBookmark(bookmarks[index]);
    bookmarks.removeAt(index);
  }

  updateBookmark(int index) async {
    var bm = bookmarks[index];

    if (bm.id == null) {
      var resId = await _bmService.addBookmark(bm);
      bm.id = resId;
    } else {
      await _bmService.updateBookmark(bm);
    }
  }
}
