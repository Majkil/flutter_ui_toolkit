import 'package:flutter/material.dart';
import 'package:universal_ui/models/UIAction.dart';

  

abstract class IDialog {
  Widget create(
    Widget title,
    Widget content,
    List<UIAction> actions,
  );
}
