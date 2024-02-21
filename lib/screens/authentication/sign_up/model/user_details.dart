// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserDetails {
  String? id;
  String? name;
  String? emailAddress;
  String? userImage;
  UserDetails({
    this.id,
    this.name,
    this.emailAddress,
    this.userImage,
  });

  UserDetails copyWith({
    String? id,
    String? name,
    String? emailAddress,
    String? userImage,
  }) {
    return UserDetails(
      id: id ?? this.id,
      name: name ?? this.name,
      emailAddress: emailAddress ?? this.emailAddress,
      userImage: userImage ?? this.userImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'emailAddress': emailAddress,
      'userImage': userImage,
    };
  }

  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      emailAddress: map['emailAddress'] != null ? map['emailAddress'] as String : null,
      userImage: map['userImage'] != null ? map['userImage'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetails.fromJson(String source) => UserDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserDetails(id: $id, name: $name, emailAddress: $emailAddress, userImage: $userImage)';
  }

  @override
  bool operator ==(covariant UserDetails other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.emailAddress == emailAddress &&
      other.userImage == userImage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      emailAddress.hashCode ^
      userImage.hashCode;
  }
}
