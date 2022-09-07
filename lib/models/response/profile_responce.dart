class ProfileResponce {
  Social? social;
  String? sId;
  User? user;
  String? company;
  String? website;
  String? location;
  String? status;
  List<String>? skills;
  String? bio;
  String? githubusername;
  List<Experience>? experience;
  List<Education>? education;
  int? iV;

  ProfileResponce(
      {this.social,
      this.sId,
      this.user,
      this.company,
      this.website,
      this.location,
      this.status,
      this.skills,
      this.bio,
      this.githubusername,
      this.experience,
      this.education,
      this.iV});

  ProfileResponce.fromJson(Map<String, dynamic> json) {
    social =
        json['social'] != null ? new Social.fromJson(json['social']) : null;
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    company = json['company'];
    website = json['website'];
    location = json['location'];
    status = json['status'];
    skills = json['skills'].cast<String>();
    bio = json['bio'];
    githubusername = json['githubusername'];
    if (json['experience'] != null) {
      experience = <Experience>[];
      json['experience'].forEach((v) {
        experience!.add(new Experience.fromJson(v));
      });
    }
    if (json['education'] != null) {
      education = <Education>[];
      json['education'].forEach((v) {
        education!.add(new Education.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.social != null) {
      data['social'] = this.social!.toJson();
    }
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['company'] = this.company;
    data['website'] = this.website;
    data['location'] = this.location;
    data['status'] = this.status;
    data['skills'] = this.skills;
    data['bio'] = this.bio;
    data['githubusername'] = this.githubusername;
    if (this.experience != null) {
      data['experience'] = this.experience!.map((v) => v.toJson()).toList();
    }
    if (this.education != null) {
      data['education'] = this.education!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Social {
  String? youtube;
  String? twitter;
  String? facebook;
  String? linkedin;
  String? instagram;

  Social(
      {this.youtube,
      this.twitter,
      this.facebook,
      this.linkedin,
      this.instagram});

  Social.fromJson(Map<String, dynamic> json) {
    youtube = json['youtube'];
    twitter = json['twitter'];
    facebook = json['facebook'];
    linkedin = json['linkedin'];
    instagram = json['instagram'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['youtube'] = this.youtube;
    data['twitter'] = this.twitter;
    data['facebook'] = this.facebook;
    data['linkedin'] = this.linkedin;
    data['instagram'] = this.instagram;
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? avatar;

  User({this.sId, this.name, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    return data;
  }
}

class Experience {
  String? title;
  String? company;
  String? location;
  String? from;
  Null? to;
  bool? current;
  String? description;
  String? sId;

  Experience(
      {this.title,
      this.company,
      this.location,
      this.from,
      this.to,
      this.current,
      this.description,
      this.sId});

  Experience.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    company = json['company'];
    location = json['location'];
    from = json['from'];
    to = json['to'];
    current = json['current'];
    description = json['description'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['company'] = this.company;
    data['location'] = this.location;
    data['from'] = this.from;
    data['to'] = this.to;
    data['current'] = this.current;
    data['description'] = this.description;
    data['_id'] = this.sId;
    return data;
  }
}

class Education {
  String? school;
  String? degree;
  String? fieldofstudy;
  String? from;
  String? to;
  bool? current;
  String? description;
  String? sId;

  Education(
      {this.school,
      this.degree,
      this.fieldofstudy,
      this.from,
      this.to,
      this.current,
      this.description,
      this.sId});

  Education.fromJson(Map<String, dynamic> json) {
    school = json['school'];
    degree = json['degree'];
    fieldofstudy = json['fieldofstudy'];
    from = json['from'];
    to = json['to'];
    current = json['current'];
    description = json['description'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['school'] = this.school;
    data['degree'] = this.degree;
    data['fieldofstudy'] = this.fieldofstudy;
    data['from'] = this.from;
    data['to'] = this.to;
    data['current'] = this.current;
    data['description'] = this.description;
    data['_id'] = this.sId;
    return data;
  }
}
