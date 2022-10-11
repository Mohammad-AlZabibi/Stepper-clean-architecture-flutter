import 'package:fluttertoast/fluttertoast.dart';

class ToastHelper {
  showToast(message) {
    Fluttertoast.showToast(
      msg: message,
    );
  }
}
