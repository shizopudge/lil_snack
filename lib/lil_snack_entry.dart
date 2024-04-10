part of 'lil_snack.dart';

/// Entry of [_LilSnackMessage] in overlay.
class _LilSnackEntry extends OverlayEntry {
  /// Creates an entry of [_LilSnackMessage] in overlay.
  _LilSnackEntry(
    this.lilSnack,
  ) : super(builder: (_) => lilSnack);

  /// LilSnack widget.
  final _LilSnackMessageBase lilSnack;
}
