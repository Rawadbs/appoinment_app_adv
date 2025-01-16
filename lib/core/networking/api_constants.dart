class ApiConstants {
  static const String apiBaseUrl = 'https://vcare.integration25.com/api/';
  static const String login = 'auth/login';
}

class ApiErrors {
  static const String badrequesterror = "bad request. try again later";
  static const String forbiddenerror = "forbidden request. try again later";
  static const String unauthorizederror = "user unauthorized, try again later";
  static const String notfounderror = "url not found, try again later";
  static const String conflicterror = "conflict found, try again later";
  static const String internalservererror =
      "some thing went wrong, try again later";
  static const String unknownerror = "some thing went wrong, try again later";
  static const String timeouterror = "time out, try again late";
  static const String defaulterror = "some thing went wrong, try again later";
  static const String cacheerror = "cache error, try again later";
  static const String nointerneterror = "Please check your internet connection";
  static const String nocontent = "success with not content";
  static const String succsess = "success";
}
