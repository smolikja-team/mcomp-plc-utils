import 'package:flutter/material.dart';

/// Shows a resizable bottom sheet.
Future showResizableBottomSheet({
  /// The context in which the bottom sheet will be shown.
  required BuildContext context,

  /// The child of the bottom sheet.
  required Widget child,

  /// Whether to use bottom padding 80.0.
  bool useBottomPadding = true,

  /// The background color of the bottom sheet.
  Color? backgroundColor,

  /// The border color of the bottom sheet.
  Color borderColor = Colors.transparent,

  /// The minimum height of the bottom sheet.
  double minHeight = 0,

  /// The minimum width of the bottom sheet.
  double minWidth = 0,

  /// The maximum height of the bottom sheet.
  double maxHeight = double.infinity,

  /// The maximum width of the bottom sheet.
  double maxWidth = double.infinity,

  /// The border radius of the bottom sheet.
  BorderRadiusGeometry borderRadius = const BorderRadius.vertical(
    top: Radius.circular(28.0),
  ),

  /// The border width of the bottom sheet.
  double borderWidth = 1.0,
}) {
  return showModalBottomSheet(
    context: context,
    useSafeArea: true,
    showDragHandle: true,
    isScrollControlled: true,
    backgroundColor: backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: borderRadius,
      side: BorderSide(color: borderColor, width: borderWidth, strokeAlign: 1),
    ),
    builder: (BuildContext context) => Container(
      constraints: BoxConstraints(
        minHeight: minHeight,
        minWidth: minWidth,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: useBottomPadding ? 80.0 : 0.0),
          child: child,
        ),
      ),
    ),
  );
}
