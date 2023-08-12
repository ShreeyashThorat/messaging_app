class UserModel {
  String? sId;
  String? name;
  String? email;
  String? number;
  String? password;
  String? gender;
  String? dob;
  String? profilePic;
  String? nationality;
  String? state;
  String? intro;
  List<String>? imageUrls;
  String? deviceToken;
  List<String>? blockedUsers;
  List<String>? blockedByUserd;
  List<String>? sentFriendRequests;
  String? accountStatus;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserModel(
      {this.sId,
      this.name,
      this.email,
      this.number,
      this.password,
      this.gender,
      this.dob,
      this.profilePic,
      this.nationality,
      this.state,
      this.intro,
      this.imageUrls,
      this.deviceToken,
      this.blockedUsers,
      this.blockedByUserd,
      this.sentFriendRequests,
      this.accountStatus,
      this.createdAt,
      this.updatedAt,
      this.iV});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    number = json['number'];
    password = json['password'];
    gender = json['gender'];
    dob = json['dob'];
    profilePic = json['profilePic'];
    nationality = json['nationality'];
    state = json['state'];
    intro = json['intro'];
    imageUrls = json['imageUrls'].cast<String>();
    deviceToken = json['deviceToken'];
    blockedUsers = json['blockedUsers'].cast<String>();
    blockedByUserd = json['blockedByUserd'].cast<String>();
    sentFriendRequests = json['sentFriendRequests'].cast<String>();
    accountStatus = json['accountStatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['number'] = number;
    data['password'] = password;
    data['gender'] = gender;
    data['dob'] = dob;
    data['profilePic'] = profilePic;
    data['nationality'] = nationality;
    data['state'] = state;
    data['intro'] = intro;
    data['imageUrls'] = imageUrls;
    data['deviceToken'] = deviceToken;
    data['blockedUsers'] = blockedUsers;
    data['blockedByUserd'] = blockedByUserd;
    data['sentFriendRequests'] = sentFriendRequests;
    data['accountStatus'] = accountStatus;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
