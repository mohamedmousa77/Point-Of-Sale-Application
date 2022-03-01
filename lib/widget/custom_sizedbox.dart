import 'package:flutter/material.dart';

Widget customSizedBox(BuildContext context, double value) {
  return SizedBox(height: MediaQuery.of(context).size.height * value);
}
