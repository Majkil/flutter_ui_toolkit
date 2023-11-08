import 'package:flutter/material.dart';
import 'package:flutter_ui_toolkit/models/UIButtonDefaults.dart';
import 'package:flutter_ui_toolkit/models/UIContainerDefaults.dart';
import 'package:flutter_ui_toolkit/models/UIHeadingDefaults.dart';
import 'package:flutter_ui_toolkit/models/UITextFieldDefaults.dart';


///
/// Solid Button Styles
///
final solidButtonStyles = UIButtonDefaults(
  elevation: 15.0,
  borderRadius: 50.0,
  labelColor: Colors.white,
  bgColor: Colors.pink,
);

///
/// Outlined Button Styles
///
final outlinedButtonStyles = UIButtonDefaults(
  borderRadius: 50.0,
  labelColor: Colors.pink,
  bgColor: Colors.white,
  borderColor: Colors.pink,
  borderWidth: 2.0,
  widthFactor: 0.6,
);

///
/// Set Primary Input Styles
///
final primaryInput =  UITextFieldDefaults(
  borderColor: Colors.black45,
  borderRadius: 8,
  //borderType: UIBorderType.outlineBorder,
  borderWidth: 2.0,
  hintColor: Colors.black54,
  bgColor: Colors.white,
);

///
/// Set Small Title Styles
///
final smallTitle = UIHeadingDefaults(
  color: Colors.black54,
  heading: 6,
);

///
/// Set UIContainer defaults
///
final errorContainer = UIContainerDefaults(
  padding: EdgeInsets.all(20),

  borderRadius: 10,
  widthFactor: 1.0, // make full width
  borderColor: Colors.red,
  borderWidth: 2.0,
  color: Colors.red.shade100,
);
