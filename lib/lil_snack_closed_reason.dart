part of 'lil_snack.dart';

/// Reason for closing LilSnack message.
enum _LilSnackClosedReason {
  /// LilSnack message closed by hide method.
  hide,

  /// LilSnack message closed by dismiss.
  dismiss,

  /// LilSnack message was removed.
  remove,

  /// LilSnack message removed due to timeout
  timeout;
}
