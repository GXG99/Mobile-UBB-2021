final String tableDomains = 'domains';

class DomainFields {
  static final List<String> values = [id, title, description];

  static final String id = '_id';
  static final String title = 'title';
  static final String description = 'description';
}

class Domain {
  int id;
  String title;
  String description;

  Domain({this.id, this.title, this.description});

  Domain copy({
    int id,
    String title,
    String description,
  }) =>
      Domain(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
      );

  static Domain fromJson(Map<String, Object> json) => Domain(
        id: json[DomainFields.id] as int,
        title: json[DomainFields.title] as String,
        description: json[DomainFields.description] as String,
      );

  Map<String, Object> toJson() => {
        DomainFields.id: id,
        DomainFields.title: title,
        DomainFields.description: description,
      };
}
