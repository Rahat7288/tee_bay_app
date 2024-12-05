class SignupModel {
  SignupModel({
      this.id, 
      this.email, 
      this.firstName, 
      this.lastName, 
      this.address, 
      this.firebaseConsoleManagerToken, 
      this.password, 
      this.dateJoined,});

  SignupModel.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
    firebaseConsoleManagerToken = json['firebase_console_manager_token'];
    password = json['password'];
    dateJoined = json['date_joined'];
  }
  num? id;
  String? email;
  String? firstName;
  String? lastName;
  String? address;
  String? firebaseConsoleManagerToken;
  String? password;
  String? dateJoined;
SignupModel copyWith({  num? id,
  String? email,
  String? firstName,
  String? lastName,
  String? address,
  String? firebaseConsoleManagerToken,
  String? password,
  String? dateJoined,
}) => SignupModel(  id: id ?? this.id,
  email: email ?? this.email,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  address: address ?? this.address,
  firebaseConsoleManagerToken: firebaseConsoleManagerToken ?? this.firebaseConsoleManagerToken,
  password: password ?? this.password,
  dateJoined: dateJoined ?? this.dateJoined,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['address'] = address;
    map['firebase_console_manager_token'] = firebaseConsoleManagerToken;
    map['password'] = password;
    map['date_joined'] = dateJoined;
    return map;
  }

}