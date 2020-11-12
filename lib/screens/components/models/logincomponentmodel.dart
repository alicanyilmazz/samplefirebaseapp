class SignInModel{
 static String _email;
 static String _password;
 static String _phoneNumber;

 static String get phoneNumber => _phoneNumber;

  static set phoneNumber(String value) {
    _phoneNumber = value;
  }

  static String get email => _email;

  static set email(String value) {
    _email = value;
  }

 static String get password => _password;

  static set password(String value) {
    _password = value;
  }
}