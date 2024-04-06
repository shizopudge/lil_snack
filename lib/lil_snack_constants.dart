part of 'lil_snack.dart';

/// Constants for [LilSnack].
@immutable
abstract final class LilSnackConstants {
  /// Default [LilSnack] display duration.
  static const defaultDuration = Duration(milliseconds: 4000);

  /// Default [LilSnack] animation duration.
  static const defaultAnimationDuration = Duration(milliseconds: 300);

  /// Default [LilSnack] reverse animation duration.
  static const defaultReverseAnimationDuration = Duration(milliseconds: 200);

  /// Default delay before show of next [LilSnack].
  static const defaultDelayBeforeNextLilSnack = Duration(milliseconds: 100);
}
