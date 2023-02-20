class CharactersModel {
  int? _code;
  String? _status;
  String? _copyright;
  String? _attributionText;
  String? _attributionHTML;
  String? _etag;
  Data? _data;

  CharactersModel(
      {int? code,
      String? status,
      String? copyright,
      String? attributionText,
      String? attributionHTML,
      String? etag,
      Data? data}) {
    if (code != null) {
      this._code = code;
    }
    if (status != null) {
      this._status = status;
    }
    if (copyright != null) {
      this._copyright = copyright;
    }
    if (attributionText != null) {
      this._attributionText = attributionText;
    }
    if (attributionHTML != null) {
      this._attributionHTML = attributionHTML;
    }
    if (etag != null) {
      this._etag = etag;
    }
    if (data != null) {
      this._data = data;
    }
  }

  int? get code => _code;
  set code(int? code) => _code = code;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get copyright => _copyright;
  set copyright(String? copyright) => _copyright = copyright;
  String? get attributionText => _attributionText;
  set attributionText(String? attributionText) =>
      _attributionText = attributionText;
  String? get attributionHTML => _attributionHTML;
  set attributionHTML(String? attributionHTML) =>
      _attributionHTML = attributionHTML;
  String? get etag => _etag;
  set etag(String? etag) => _etag = etag;
  Data? get data => _data;
  set data(Data? data) => _data = data;

  CharactersModel.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _status = json['status'];
    _copyright = json['copyright'];
    _attributionText = json['attributionText'];
    _attributionHTML = json['attributionHTML'];
    _etag = json['etag'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['status'] = this._status;
    data['copyright'] = this._copyright;
    data['attributionText'] = this._attributionText;
    data['attributionHTML'] = this._attributionHTML;
    data['etag'] = this._etag;
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    return data;
  }
}

class Data {
  int? _offset;
  int? _limit;
  int? _total;
  int? _count;
  List<Results>? _results;

  Data(
      {int? offset,
      int? limit,
      int? total,
      int? count,
      List<Results>? results}) {
    if (offset != null) {
      this._offset = offset;
    }
    if (limit != null) {
      this._limit = limit;
    }
    if (total != null) {
      this._total = total;
    }
    if (count != null) {
      this._count = count;
    }
    if (results != null) {
      this._results = results;
    }
  }

  int? get offset => _offset;
  set offset(int? offset) => _offset = offset;
  int? get limit => _limit;
  set limit(int? limit) => _limit = limit;
  int? get total => _total;
  set total(int? total) => _total = total;
  int? get count => _count;
  set count(int? count) => _count = count;
  List<Results>? get results => _results;
  set results(List<Results>? results) => _results = results;

  Data.fromJson(Map<String, dynamic> json) {
    _offset = json['offset'];
    _limit = json['limit'];
    _total = json['total'];
    _count = json['count'];
    if (json['results'] != null) {
      _results = <Results>[];
      json['results'].forEach((v) {
        _results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this._offset;
    data['limit'] = this._limit;
    data['total'] = this._total;
    data['count'] = this._count;
    if (this._results != null) {
      data['results'] = this._results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? _id;
  String? _name;
  String? _description;
  Thumbnail? _thumbnail;

  Results({
    int? id,
    String? name,
    String? description,
    Thumbnail? thumbnail,
  }) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (description != null) {
      this._description = description;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  Thumbnail? get thumbnail => _thumbnail;
  set thumbnail(Thumbnail? thumbnail) => _thumbnail = thumbnail;

  Results.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
 
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['description'] = this._description;
    if (this._thumbnail != null) {
      data['thumbnail'] = this._thumbnail!.toJson();
    }
    return data;
  }
}

class Thumbnail {
  String? _path;
  String? _extension;

  Thumbnail({String? path, String? extension}) {
    if (path != null) {
      this._path = path;
    }
    if (extension != null) {
      this._extension = extension;
    }
  }

  String? get path => _path;
  set path(String? path) => _path = path;
  String? get extension => _extension;
  set extension(String? extension) => _extension = extension;

  Thumbnail.fromJson(Map<String, dynamic> json) {
    _path = json['path'];
    _extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this._path;
    data['extension'] = this._extension;
    return data;
  }
}
