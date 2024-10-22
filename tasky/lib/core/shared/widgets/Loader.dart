import 'package:flutter/material.dart';

Widget buildLoader() {
  return const Center(
    child: SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator(),
    ),
  );
}
