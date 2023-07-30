// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      sId: fields[0] as String?,
      name: fields[1] as String?,
      email: fields[2] as String?,
      number: fields[3] as String?,
      password: fields[4] as String?,
      gender: fields[5] as String?,
      dob: fields[6] as String?,
      profilePic: fields[7] as String?,
      nationality: fields[8] as String?,
      state: fields[9] as String?,
      intro: fields[10] as String?,
      imageUrls: (fields[11] as List?)?.cast<String>(),
      accountStatus: fields[12] as String?,
      createdAt: fields[13] as String?,
      updatedAt: fields[14] as String?,
      iV: fields[15] as int?,
      blockedUsers: (fields[16] as List?)?.cast<String>(),
      blockedByUserd: (fields[17] as List?)?.cast<String>(),
      sentFriendRequests: (fields[18] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.sId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.number)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.dob)
      ..writeByte(7)
      ..write(obj.profilePic)
      ..writeByte(8)
      ..write(obj.nationality)
      ..writeByte(9)
      ..write(obj.state)
      ..writeByte(10)
      ..write(obj.intro)
      ..writeByte(11)
      ..write(obj.imageUrls)
      ..writeByte(12)
      ..write(obj.accountStatus)
      ..writeByte(13)
      ..write(obj.createdAt)
      ..writeByte(14)
      ..write(obj.updatedAt)
      ..writeByte(15)
      ..write(obj.iV)
      ..writeByte(16)
      ..write(obj.blockedUsers)
      ..writeByte(17)
      ..write(obj.blockedByUserd)
      ..writeByte(18)
      ..write(obj.sentFriendRequests);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
