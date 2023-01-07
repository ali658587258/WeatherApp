import 'package:flutter/material.dart';

import 'service/dio_helper/dio_helper.dart';
import 'src/app_root.dart';

void main() {
  DioHelper.init();
  runApp(AppRoot());
}