import 'package:flutter/foundation.dart';


import 'package:flutter/cupertino.dart';
import 'package:universal_ui/models/UIAction.dart';
import 'android_action_sheet.dart';
import 'iaction_sheet.dart';
import 'ios_action_sheet.dart';

///
/// Renders a dialog based on the [Platform] OS
///
class UIActionSheet {
  static Future<T?> show<T>(
    BuildContext context, {
    Widget? title,
    Widget? content,
    List<UIAction>? actions,
    UIAction? cancel,
    bool forceAndroid = false,
    bool forceIos = false,
  }) {
    ///
    /// Define a generic [IDialog]
    IActionSheet dialogData;

    ///
    /// [dialogData] will be either a [IosDialog] or [AndroidDialog]
    ///
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        dialogData = AndroidActionSheet();
        break;
      case TargetPlatform.iOS:
        dialogData = IosActionSheet();
        break;
      default:
        dialogData = AndroidActionSheet();
    }
    

    ///
    /// Show Dialog [dialogData]
    ///
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => dialogData.create(
        context,
        title ?? Text('Untitled'),
        content ?? Text('Content missing.'),
        actions ?? [],
        cancel,
      ),
    );
  }
}
