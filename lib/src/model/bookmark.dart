class Bookmark {
  Bookmark({
    this.id,
    this.title = '',
    this.description = '',
    this.url = '',
    this.edit = true,
  });

  Bookmark.fromMap(Map bm)
      : this(
          id: bm['id'],
          title: bm['title'],
          description: bm['description'],
          url: bm['url'],
          edit: bm['edit'] ?? false,
        );

  String id;
  String title;
  String description;
  String url;
  bool edit;

  asMap() => {
        'title': title,
        'description': description,
        'url': url,
      };

  update(Bookmark bm) {
    title = bm.title;
    description = bm.description;
    url = bm.url;
    edit = bm.edit;
  }
}
