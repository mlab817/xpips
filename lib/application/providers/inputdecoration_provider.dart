import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final inputDecorationProvider = Provider<InputDecoration>((ref) {
  return const InputDecoration(
    isCollapsed: true,
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    fillColor: Colors.transparent,
    hoverColor: Colors.transparent,
  );
});
