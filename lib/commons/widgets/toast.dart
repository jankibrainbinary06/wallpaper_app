import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallpaperapp/utils/colorRes.dart';

void toast(String msg) {
  Fluttertoast.showToast(msg: msg,backgroundColor: ColorRes.gradiantColour);
}