import 'package:flutter/material.dart';
import 'package:universal_ui/models/UIAction.dart';
  

abstract class IActionSheet {
  Widget create(
    BuildContext context,
    Widget title,
    Widget content,
    List<UIAction> actions,
    UIAction? cancel,
  );
}
