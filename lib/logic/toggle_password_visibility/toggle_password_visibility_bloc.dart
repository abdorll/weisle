import 'package:rxdart/rxdart.dart';

class TogglePasswordVisibilityBloc {
  // ignore: prefer_final_fields, unnecessary_new
  var _showPassword = new BehaviorSubject<bool>();

  Stream<bool> get showPassword => _showPassword.stream;

  toggleShowPassword() => _showPassword.add(!_showPassword.value);

  TogglePasswordVisibilityBloc() {
    _showPassword.add(true);
  }
}
