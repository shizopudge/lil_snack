part of 'lil_snack.dart';

/// Lil snack type enum.
enum LilSnackType {
  /// Type of success [_LilSnackMessage].
  success,

  /// Type of error [_LilSnackMessage].
  error,

  /// Type of warning [_LilSnackMessage].
  warning,

  /// Type of notification [_LilSnackMessage].
  notification,

  /// Type of custom [_LilSnackMessage].
  custom;
}
