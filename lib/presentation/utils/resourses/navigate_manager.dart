import 'package:flutter/material.dart';

void onNavigate(BuildContext context, {required Widget page}) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => page));
}
