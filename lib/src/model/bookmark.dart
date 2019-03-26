class Bookmark {
  Bookmark({
    this.title = '',
    this.description = '',
    this.url = '',
    this.edit = true,
    this.isFresh = true,
  });

  update(Bookmark bm) {
    title = bm.title;
    description = bm.description;
    url = bm.url;
    edit = bm.edit;
    isFresh = bm.isFresh;
  }

  String title;
  String description;
  String url;
  bool edit;
  bool isFresh;
}
