import 'package:flutter/cupertino.dart';

class BaseProvider extends ChangeNotifier {
  bool _loading = false;
  BuildContext? _context;

  bool get loading => _loading;
  BuildContext get ctx => _context!;

  set setBuildContext(BuildContext context) {
    _context = context;
  }

  set setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }
}

//B3, C6, C4, C4, C5
