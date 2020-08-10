import 'package:flutter/material.dart';

/// Global application themes.

ThemeData lightTheme = ThemeData(
  backgroundColor: Colors.white,
  // Define the default brightness and colors.
  brightness: Brightness.light,
  // bot message bubble color
  primaryColor: Colors.grey[600],
  // user message bubble color
  accentColor: Colors.grey[200],
  // Define the default font family.
  fontFamily: 'Helvetica',
  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    title: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.white),
    subtitle: TextStyle(
        fontSize: 15.0, fontWeight: FontWeight.w600, color: Colors.white),
    body1:
        TextStyle(fontSize: 15.0, fontFamily: 'Helvetica', color: Colors.white),
  ),
);

ThemeData darkTheme = ThemeData(
  backgroundColor: Colors.grey[800],
  // Define the default brightness and colors.
  brightness: Brightness.dark,
  // bot message bubble color
  primaryColor: Colors.grey[700],
  // user message bubble color
  accentColor: Colors.grey[350],
  // Define the default font family.
  fontFamily: 'Helvetica',
  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    title: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.white),
    subtitle: TextStyle(
        fontSize: 15.0, fontWeight: FontWeight.w600, color: Colors.white),
    body1:
        TextStyle(fontSize: 15.0, fontFamily: 'Helvetica', color: Colors.white),
  ),
);