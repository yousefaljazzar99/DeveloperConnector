class UserAuth {
  String? sId;
  String? name;
  String? email;
  String? avatar;
  String? date;
  int? iV;

  UserAuth({this.sId, this.name, this.email, this.avatar, this.date, this.iV});

  UserAuth.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}
