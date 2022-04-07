import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:space_square/app/app.dart';

void main() {
  runApp( MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}
