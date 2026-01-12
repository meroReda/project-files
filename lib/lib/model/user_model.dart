class UserModel {
  final String userID;
  final String email;
  final String password;
  final String fullName;
  final String? yearOfJoining; // إضافة حقل سنة الالتحاق (اختياري)
  String? securityQuestion;
  bool? isTrue; // لدي مواد مكتمله
  UserModel({
    this.securityQuestion,
    required this.userID,
    required this.email,
    required this.password,
    required this.fullName,
    required this.isTrue,
    this.yearOfJoining, // جعله اختياريًا
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      isTrue: json['isTrue'] ?? false,
      userID: json['user_id']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      password: json['password']?.toString() ?? '',
      fullName: json['fullName']?.toString() ?? '',
      yearOfJoining: json['year_of_joining']?.toString(),
      securityQuestion: json['security_question']?.toString(),
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'user_id': userID,
      'email': email,
      'password': password,
      'fullName': fullName,
      'year_of_joining': yearOfJoining,
      'security_question': securityQuestion,
      'isTrue' : isTrue,
    };
  }


  // دالة لإنشاء نسخة جديدة مع تحديث بعض الحقول
  UserModel copyWith({
    String? userID,
    String? email,
    String? password,
    String? fullName,
    String? yearOfJoining,
    bool ? isTrue,
    String? securityQuestion
  }) {
    return UserModel(
      isTrue: isTrue?? this.isTrue,
      securityQuestion:  securityQuestion ?? this.securityQuestion,
      userID: userID ?? this.userID,
      email: email ?? this.email,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      yearOfJoining: yearOfJoining ?? this.yearOfJoining,
    );
  }
}