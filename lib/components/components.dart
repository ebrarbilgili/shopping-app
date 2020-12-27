import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color get black => Colors.black;
Color get white => Colors.white;

routeTo(BuildContext context, route) =>
    Navigator.of(context).push(CupertinoPageRoute(builder: (context) => route));
