class UserModel {
  String? name;
  String? fatherName;
  String? email;

  UserModel({
    this.name,
    this.fatherName,
    this.email,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is UserModel &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              fatherName == other.fatherName &&
              email == other.email);

  @override
  int get hashCode =>
      name.hashCode ^
      fatherName.hashCode ^
      email.hashCode;

  @override
  String toString() {
    return 'UserModel{' +
        ' name: $name,' +
        ' fatherName: $fatherName,' +
        ' email: $email,' +
        '}';
  }

  UserModel copyWith({
    String? name,
    String? fatherName,
    String? email,
  }) {
    return UserModel(
      name: name ?? this.name,
      fatherName: fatherName ?? this.fatherName,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'fatherName': this.fatherName,
      'email': this.email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      fatherName: map['fatherName'] as String,
      email: map['email'] as String,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic>? map) {
    return UserModel(
      name: map?['name'] as String,
      fatherName: map?['fatherName'] as String,
      email: map?['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'fatherName': this.fatherName,
      'email': this.email,
    };
  }
}