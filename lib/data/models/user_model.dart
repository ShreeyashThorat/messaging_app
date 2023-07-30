import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? number;
  @HiveField(3)
  String? password;
  @HiveField(4)
  String? gender;
  @HiveField(5)
  String? dob;
  @HiveField(6)
  String? profilePic;
  @HiveField(7)
  String? nationality;
  @HiveField(8)
  String? state;
  @HiveField(9)
  String? intro;
  @HiveField(10)
  List<String>? imageUrls;
  @HiveField(11)
  String? deviceToken;
  @HiveField(12)
  List<String>? blockedUsers;
  @HiveField(13)
  List<String>? blockedByUserd;
  @HiveField(14)
  List<String>? sentFriendRequests;
  @HiveField(15)
  String? accountStatus;
  @HiveField(16)
  String? sId;
  @HiveField(17)
  String? createdAt;
  @HiveField(18)
  String? updatedAt;
  @HiveField(19)
  int? iV;

  UserModel(
      {this.name,
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
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  UserModel.fromJson(Map<String, dynamic> json) {
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
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}













// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'user_model.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class UserModelAdapter extends TypeAdapter<UserModel> {
//   @override
//   final int typeId = 0;

//   @override
//   UserModel read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return UserModel(
//       name: fields[0] as String?,
//       email: fields[1] as String?,
//       number: fields[2] as String?,
//       password: fields[3] as String?,
//       gender: fields[4] as String?,
//       dob: fields[5] as String?,
//       profilePic: fields[6] as String?,
//       nationality: fields[7] as String?,
//       state: fields[8] as String?,
//       intro: fields[9] as String?,
//       imageUrls: (fields[10] as List?)?.cast<String>(),
//       deviceToken: fields[11] as String?,
//       blockedUsers: (fields[12] as List?)?.cast<String>(),
//       blockedByUserd: (fields[13] as List?)?.cast<String>(),
//       sentFriendRequests: (fields[14] as List?)?.cast<String>(),
//       accountStatus: fields[15] as String?,
//       sId: fields[16] as String?,
//       createdAt: fields[17] as String?,
//       updatedAt: fields[18] as String?,
//       iV: fields[19] as int?,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, UserModel obj) {
//     writer
//       ..writeByte(20)
//       ..writeByte(0)
//       ..write(obj.name)
//       ..writeByte(1)
//       ..write(obj.email)
//       ..writeByte(2)
//       ..write(obj.number)
//       ..writeByte(3)
//       ..write(obj.password)
//       ..writeByte(4)
//       ..write(obj.gender)
//       ..writeByte(5)
//       ..write(obj.dob)
//       ..writeByte(6)
//       ..write(obj.profilePic)
//       ..writeByte(7)
//       ..write(obj.nationality)
//       ..writeByte(8)
//       ..write(obj.state)
//       ..writeByte(9)
//       ..write(obj.intro)
//       ..writeByte(10)
//       ..write(obj.imageUrls)
//       ..writeByte(11)
//       ..write(obj.deviceToken)
//       ..writeByte(12)
//       ..write(obj.blockedUsers)
//       ..writeByte(13)
//       ..write(obj.blockedByUserd)
//       ..writeByte(14)
//       ..write(obj.sentFriendRequests)
//       ..writeByte(15)
//       ..write(obj.accountStatus)
//       ..writeByte(16)
//       ..write(obj.sId)
//       ..writeByte(17)
//       ..write(obj.createdAt)
//       ..writeByte(18)
//       ..write(obj.updatedAt)
//       ..writeByte(19)
//       ..write(obj.iV);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is UserModelAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
