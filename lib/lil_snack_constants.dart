part of 'lil_snack.dart';

/// Constants for LilSnack message.
@immutable
abstract final class LilSnackConstants {
  /// Default LilSnack message display duration.
  static const defaultDuration = Duration(milliseconds: 4000);

  /// Default LilSnack message animation duration.
  static const defaultAnimationDuration = Duration(milliseconds: 300);

  /// Default LilSnack message reverse animation duration.
  static const defaultReverseAnimationDuration = Duration(milliseconds: 200);

  /// Default delay before show of next LilSnack message.
  static const defaultDelayBeforeNextLilSnack = Duration(milliseconds: 100);
}
