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
  Color? borderColor,

  /// The minimum height of the bottom sheet.
  double? minHeight,

  /// The minimum width of the bottom sheet.
  double? minWidth,

  /// The maximum height of the bottom sheet.
  double? maxHeight,

  /// The maximum width of the bottom sheet.
  double? maxWidth,

  /// The border radius of the bottom sheet.
  BorderRadiusGeometry borderRadius =
      const BorderRadius.vertical(top: Radius.circular(28.0)),
}) {
  return showModalBottomSheet(
    context: context,
    useSafeArea: true,
    showDragHandle: true,
    isScrollControlled: true,
    backgroundColor: backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: borderRadius,
      side: BorderSide(
        color: borderColor ?? Colors.transparent,
        width: 1.0,
        strokeAlign: 1,
      ),
    ),
    builder: (BuildContext context) => Container(
      constraints: BoxConstraints(
        minHeight: minHeight ?? 0,
        minWidth: minWidth ?? 0,
        maxHeight: maxHeight ?? double.infinity,
        maxWidth: maxWidth ?? double.infinity,
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
