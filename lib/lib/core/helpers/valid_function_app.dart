class ValidFunctionApp {
  static String validateEmail(String email) {
    final RegExp pattern = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (email.isEmpty) {
      return "البريد الإلكتروني لا يمكن أن يكون فارغًا.";
    } else if (!pattern.hasMatch(email)) {
      return "بريد الإلكتروني غير صالح : yourname@mail.com";
    }
    return '';
  }

 static String validatePassword(String password) {
  if (password.isEmpty) {
    return "كلمة المرور لا يمكن أن تكون فارغة";
  }

  if (password.length < 8) {
    return "كلمة المرور قصيرة جداً (يجب أن تكون 8 أحرف على الأقل)";
  }

  List<String> errors = [];

  // التحقق من وجود حرف كبير
  if (!password.contains(RegExp(r'[A-Z]'))) {
    errors.add("يجب أن تحتوي على حرف كبير واحد على الأقل (A-Z)");
  }

  // التحقق من وجود حرف صغير
  if (!password.contains(RegExp(r'[a-z]'))) {
    errors.add("يجب أن تحتوي على حرف صغير واحد على الأقل (a-z)");
  }

  // التحقق من وجود رقم
  if (!password.contains(RegExp(r'[0-9]'))) {
    errors.add("يجب أن تحتوي على رقم واحد على الأقل (0-9)");
  }

  // التحقق من وجود حرف خاص (اختياري)
  // if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
  //   errors.add("يجب أن تحتوي على حرف خاص واحد على الأقل");
  // }

  // التحقق من أن كلمة المرور ليست سهلة التخمين
  final weakPasswords = ['password', '12345678', 'qwerty', 'admin', 'user'];
  if (weakPasswords.contains(password.toLowerCase())) {
    errors.add("كلمة المرور ضعيفة جداً وسهلة التخمين");
  }

  // إرجاع الرسالة المناسبة
  if (errors.isEmpty) {
    return '';
  } else {
    return ' ${errors.join('\n• ')}';
  }
}

  static String validateName(String name) {
    final RegExp pattern = RegExp(r'^[a-zA-Zأ-ي\s]+$');
    if (name.isEmpty) {
      return "اسم المستخدم لا يمكن أن يكون فارغًا.";
    } else if (!pattern.hasMatch(name)) {
      return "اسم المستخدم يجب أن يحتوي على حروف فقط";
    }
    return '';
  }
  static String validatePhoneNumber(String phoneNumber) {
    final RegExp pattern = RegExp(r'^(091|092|093|094)\d{7}$');
    if (phoneNumber.isEmpty) {
      return "رقم الهاتف لا يمكن أن يكون فارغًا.";
    } else if (!pattern.hasMatch(phoneNumber)) {
      return "رقم الهاتف غير صالح. يجب أن يبدأ بـ 091 أو 092 أو 093 أو 094 و يحتوي على 10 أرقام.";
    }
    return '';
  }
}
