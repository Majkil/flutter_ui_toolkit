import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_ui/UIUtils.dart';
import 'package:universal_ui/models/UIButtonDefaults.dart';

  
  
import 'button_content.dart';

class UIButton {
  ///
  /// Outlined Button
  static Widget outlined({
    UIButtonDefaults? as,
    String? label,
    Color? labelColor,
    required Function onPressed,
    Color? borderColor,
    Color? bgColor,
    double? borderRadius,
    double? borderWidth,
    double? elevation,
    double? widthFactor,
    Widget? icon,
  }) {
    return FractionallySizedBox(
      widthFactor: UIUtils.getDouble(as, as?.widthFactor, widthFactor, 1.0),
      child: OutlinedButton(
        onPressed: onPressed as void Function(),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            as?.padding ?? EdgeInsets.all(15.0),
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) return Colors.black12;
              if (states.contains(MaterialState.hovered)) return Colors.black12;
              if (states.contains(MaterialState.pressed)) return Colors.black12;
              return null; // Defer to the widget's default.
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return UIUtils.getColor(as, as?.bgColor, bgColor, Colors.blue);
            },
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                UIUtils.getDouble(as, as?.borderRadius, borderRadius, 0.0),
              ),
            ),
          ),
          side: MaterialStateProperty.resolveWith<BorderSide>(
            (Set<MaterialState> states) {
              return BorderSide(
                width: UIUtils.getDouble(as, as?.borderWidth, borderWidth, 2.0),
                color: UIUtils.getColor(as, as?.borderColor, borderColor, Colors.transparent),
              );
            },
          ),
        ),
        child: FractionallySizedBox(
          child: UIButtonContent(as, label, labelColor, icon),
        ),
      ),
    );
  }

  ///
  /// Outlined Button
  static Widget solid({
    UIButtonDefaults? as,
    String? label,
    Color? labelColor,
    required Function onPressed,
    Color? bgColor,
    double? borderRadius,
    double? elevation,
    double? widthFactor,
    Widget? icon,
    Color? shadowColor,
  }) {
    return FractionallySizedBox(
      alignment: Alignment.centerLeft,
      widthFactor: UIUtils.getDouble(as, as?.widthFactor, widthFactor, 1.0),
      child: TextButton(
        child: UIButtonContent(as, label, labelColor, icon),
        onPressed: onPressed as void Function(),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            as?.padding ?? EdgeInsets.all(15.0),
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) return Colors.black12;
              if (states.contains(MaterialState.hovered)) return Colors.black12;
              if (states.contains(MaterialState.pressed)) return Colors.black12;
              return null; // Defer to the widget's default.
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return UIUtils.getColor(as, as?.bgColor, bgColor, Colors.blue);
            },
          ),
          elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
              return UIUtils.getDouble(as, as?.elevation, elevation, 1.0);
            },
          ),
          shadowColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return UIUtils.getColor(as, as?.shadowColor, shadowColor, Colors.black);
            },
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                UIUtils.getDouble(as, as?.borderRadius, borderRadius, 0.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///
  /// Native Buttons
  ///
  static Widget native({
    Function? onPressed,
    String? label,
    Color? labelColor,
    Color? bgColor,
    double? widthFactor,
  }) {
    if (defaultTargetPlatform== TargetPlatform.iOS) {
      return FractionallySizedBox(
        widthFactor: widthFactor,
        child: CupertinoButton(
          color: bgColor,
          child: Text(
            label!,
            style: TextStyle(
              color: labelColor,
            ),
          ),
          onPressed: onPressed as void Function()?,
        ),
      );
    } else {
      return FractionallySizedBox(
        widthFactor: widthFactor,
        child: TextButton(
          child: Text(
            label!,
            style: TextStyle(
              color: labelColor ?? Colors.black,
            ),
          ),
          onPressed: onPressed as void Function()?,
          style: TextButton.styleFrom(
            backgroundColor: bgColor,
          ),
        ),
      );
    }
  }
}
