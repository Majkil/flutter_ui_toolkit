import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_ui/models/UIAction.dart';
import 'package:universal_ui/widgets/UIDialog/android_dialog.dart';
import 'package:universal_ui/widgets/UIDialog/idialog.dart';
import 'package:universal_ui/widgets/UIDialog/ios_dialog.dart';
 


///
/// Renders a dialog based on the [Platform] OS
///
class UIDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    Widget? title,
    Widget? content,
    List<UIAction>? actions,
    bool forceAndroid = false,
    bool forceIos = false,
  }) {
    ///
    /// Define a generic [IDialog]
    IDialog dialogData;

    ///
    /// [dialogData] will be either a [IosDialog] or [AndroidDialog]
    ///
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        dialogData = AndroidDialog();
        break;
      case TargetPlatform.iOS:
        dialogData = IosDialog();
        break;
      default:
        dialogData = AndroidDialog();
        break;
    }

    ///
    /// Show Dialog [dialogData]
    ///
    return showDialog(
      context: context,
      builder: (context) => dialogData.create(
        title ?? Text('Untitled'),
        content ?? Text('Content missing.'),
        actions ?? [],
      ),
    );
  }
}
