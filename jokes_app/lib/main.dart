import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jokes_app/app_root.dart';

void main() {
  runApp(const ProviderScope(child: AppRoot()));
}
