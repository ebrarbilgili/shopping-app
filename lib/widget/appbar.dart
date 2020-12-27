import 'package:flutter/cupertino.dart';
import 'package:shopping_app/components/components.dart';

CupertinoNavigationBar navigationBar(String title, Widget trailing) {
  return CupertinoNavigationBar(
    middle: Text(title),
    actionsForegroundColor: black,
    border: Border.all(color: white),
    backgroundColor: white,
    trailing: trailing,
  );
}
