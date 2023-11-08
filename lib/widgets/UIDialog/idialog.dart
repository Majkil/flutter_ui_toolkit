import 'package:flutter/material.dart';
import 'package:universal_ui/flutter_ui_toolkit.dart';
  

abstract class IDialog {
  Widget create(
    Widget title,
    Widget content,
    List<UIAction> actions,
  );
}
