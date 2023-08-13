import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String? sId;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? email;

  @HiveField(3)
  String? number;

  @HiveField(4)
  String? password;

  @HiveField(5)
  String? gender;

  @HiveField(6)
  String? dob;

  @HiveField(7)
  String? profilePic;

  @HiveField(8)
  String? nationality;

  @HiveField(9)
  String? state;

  @HiveField(10)
  String? intro;

  @HiveField(11)
  List<String>? imageUrls;

  @HiveField(12)
  String? deviceToken;

  @HiveField(13)
  List<String>? blockedUsers;

  @HiveField(14)
  List<String>? blockedByUserd;

  @HiveField(15)
  List<String>? sentFriendRequests;

  @HiveField(16)
  String? accountStatus;

  @HiveField(17)
  String? createdAt;

  @HiveField(18)
  String? updatedAt;

  @HiveField(19)
  int? iV;

  UserModel({
    this.sId,
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
    this.iV,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      sId: json['_id'],
      name: json['name'],
      email: json['email'],
      number: json['number'],
      password: json['password'],
      gender: json['gender'],
      dob: json['dob'],
      profilePic: json['profilePic'],
      nationality: json['nationality'],
      state: json['state'],
      intro: json['intro'],
      imageUrls: json['imageUrls'] != null
          ? List<String>.from(json['imageUrls'])
          : null,
      deviceToken: json['deviceToken'],
      blockedUsers: json['blockedUsers'] != null
          ? List<String>.from(json['blockedUsers'])
          : null,
      blockedByUserd: json['blockedByUserd'] != null
          ? List<String>.from(json['blockedByUserd'])
          : null,
      sentFriendRequests: json['sentFriendRequests'] != null
          ? List<String>.from(json['sentFriendRequests'])
          : null,
      accountStatus: json['accountStatus'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v'],
    );
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
