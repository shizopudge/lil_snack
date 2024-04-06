part of 'lil_snack.dart';

/// Reason for closing [_LilSnackMessage].
enum _LilSnackClosedReason {
  /// [_LilSnackMessage] closed by hide method.
  hide,

  /// [_LilSnackMessage] closed by dismiss.
  dismiss,

  /// [_LilSnackMessage] was removed.
  remove,

  /// [_LilSnackMessage] removed due to timeout
  timeout;
}
