class LoginResponseModel {
  LoginResponseModel({
      this.message, 
      this.user,});

  LoginResponseModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? message;
  User? user;
LoginResponseModel copyWith({  String? message,
  User? user,
}) => LoginResponseModel(  message: message ?? this.message,
  user: user ?? this.user,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      this.id, 
      this.email, 
      this.firstName, 
      this.lastName, 
      this.address, 
      this.firebaseConsoleManagerToken, 
      this.password, 
      this.dateJoined,});

  User.fromJson(dynamic json) {
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
User copyWith({  num? id,
  String? email,
  String? firstName,
  String? lastName,
  String? address,
  String? firebaseConsoleManagerToken,
  String? password,
  String? dateJoined,
}) => User(  id: id ?? this.id,
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