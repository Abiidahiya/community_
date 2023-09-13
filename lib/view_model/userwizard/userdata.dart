class UserData {
  final String firstName;
  final String lastName;
  final String email;
  final String userbio;


  UserData({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.userbio,

  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'userbio': userbio,

    };
  }
}