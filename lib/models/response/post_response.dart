class postResponse {
  String? sId;
  String? user;
  String? text;
  String? name;
  String? avatar;
  String? date;

  int? iV;

  postResponse(
      {this.sId,
      this.user,
      this.text,
      this.name,
      this.avatar,
      this.date,
      this.iV});

  postResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    text = json['text'];
    name = json['name'];
    avatar = json['avatar'];
    date = json['date'];

    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['text'] = this.text;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['date'] = this.date;

    data['__v'] = this.iV;
    return data;
  }
}
