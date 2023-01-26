class CommentModel {
  int? _postId;
  int? _id;
  String? _name;
  String? _email;
  String? _body;

  CommentModel(
      {int? postId, int? id, String? name, String? email, String? body}) {
    if (postId != null) {
      this._postId = postId;
    }
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (email != null) {
      this._email = email;
    }
    if (body != null) {
      this._body = body;
    }
  }

  int? get postId => _postId;
  set postId(int? postId) => _postId = postId;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get body => _body;
  set body(String? body) => _body = body;

  CommentModel.fromJson(Map<String, dynamic> json) {
    _postId = json['postId'];
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this._postId;
    data['id'] = this._id;
    data['name'] = this._name;
    data['email'] = this._email;
    data['body'] = this._body;
    return data;
  }
}
