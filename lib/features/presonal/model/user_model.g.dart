// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromSnapShot(
    DocumentSnapshot<Map<String, dynamic>> document) {
  if (document.data() != null) {
    final data = document.data()!;
    return UserModel(
      email: data['email'] ?? "",
      userName: data['userName'] ?? "",
      firstName: data['firstName'] ?? "",
      lastName: data['lastName'] ?? "",
      phoneNumber: data['phoneNumber'] ?? "",
      profilePicture: data['profilePicture'] ?? "",
      id: document.id,
    );
  } else {
    return UserModel.empty();
  }
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'userName': instance.userName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'profilePicture': instance.profilePicture,
    };