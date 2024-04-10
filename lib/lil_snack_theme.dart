part of 'lil_snack.dart';

/// Theme of LilSnack.
@immutable
class LilSnackTheme extends ThemeExtension<LilSnackTheme> {
  /// Creates theme of LilSnack.
  const LilSnackTheme({
    required this.successIconColor,
    required this.warningIconColor,
    required this.errorIconColor,
    required this.notificationIconColor,
    required this.successBackgroundColor,
    required this.warningBackgroundColor,
    required this.errorBackgroundColor,
    required this.notificationBackgroundColor,
    required this.successTextStyle,
    required this.warningTextStyle,
    required this.errorTextStyle,
    required this.notificationTextStyle,
    required this.borderRadius,
    required this.boxShadow,
    required this.iconSize,
    this.successIcon = Icons.check_circle_rounded,
    this.warningIcon = Icons.warning_rounded,
    this.errorIcon = Icons.error_rounded,
    this.notificationIcon = Icons.notifications_rounded,
  });

  /// Success icon color.
  final Color? successIconColor;

  /// Warning icon color.
  final Color? warningIconColor;

  /// Error icon color.
  final Color? errorIconColor;

  /// Notification icon color.
  final Color? notificationIconColor;

  /// Success background color.
  final Color? successBackgroundColor;

  /// Warning background color.
  final Color? warningBackgroundColor;

  /// Error background color.
  final Color? errorBackgroundColor;

  /// Notification background color.
  final Color? notificationBackgroundColor;

  /// Decoration border radius.
  final BorderRadiusGeometry? borderRadius;

  /// Shadows.
  final List<BoxShadow>? boxShadow;

  /// Size of icons.
  final double? iconSize;

  /// Success text style.
  final TextStyle? successTextStyle;

  /// Warning text style.
  final TextStyle? warningTextStyle;

  /// Error text style.
  final TextStyle? errorTextStyle;

  /// Notification text style.
  final TextStyle? notificationTextStyle;

  /// Success icon.
  ///
  /// By default its Icons.check_circle_rounded.
  final IconData successIcon;

  /// Warning icon.
  ///
  /// By default its Icons.warning_rounded.
  final IconData warningIcon;

  /// Error icon.
  ///
  /// By default its Icons.error_rounded.
  final IconData errorIcon;

  /// Notification icon.
  ///
  /// By default its Icons.notifications_rounded.
  final IconData notificationIcon;

  @override
  LilSnackTheme copyWith({
    Color? successIconColor,
    Color? warningIconColor,
    Color? errorIconColor,
    Color? notificationIconColor,
    Color? successBackgroundColor,
    Color? warningBackgroundColor,
    Color? errorBackgroundColor,
    Color? notificationBackgroundColor,
    TextStyle? successTextStyle,
    TextStyle? warningTextStyle,
    TextStyle? errorTextStyle,
    TextStyle? notificationTextStyle,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
    double? iconSize,
    IconData? successIcon,
    IconData? warningIcon,
    IconData? errorIcon,
    IconData? notificationIcon,
  }) =>
      LilSnackTheme(
        successIconColor: successIconColor ?? this.successIconColor,
        warningIconColor: warningIconColor ?? this.warningIconColor,
        errorIconColor: errorIconColor ?? this.errorIconColor,
        notificationIconColor:
            notificationIconColor ?? this.notificationIconColor,
        successBackgroundColor:
            successBackgroundColor ?? this.successBackgroundColor,
        warningBackgroundColor:
            warningBackgroundColor ?? this.warningBackgroundColor,
        errorBackgroundColor: errorBackgroundColor ?? this.errorBackgroundColor,
        notificationBackgroundColor:
            notificationBackgroundColor ?? this.notificationBackgroundColor,
        borderRadius: borderRadius ?? this.borderRadius,
        boxShadow: boxShadow ?? this.boxShadow,
        iconSize: iconSize ?? this.iconSize,
        successTextStyle: successTextStyle ?? this.successTextStyle,
        warningTextStyle: warningTextStyle ?? this.warningTextStyle,
        errorTextStyle: errorTextStyle ?? this.errorTextStyle,
        notificationTextStyle:
            notificationTextStyle ?? this.notificationTextStyle,
        successIcon: successIcon ?? this.successIcon,
        warningIcon: warningIcon ?? this.warningIcon,
        errorIcon: errorIcon ?? this.errorIcon,
        notificationIcon: notificationIcon ?? this.notificationIcon,
      );

  @override
  LilSnackTheme lerp(LilSnackTheme? other, double t) {
    if (other is! LilSnackTheme) return this;
    return LilSnackTheme(
      successIconColor: Color.lerp(
        successIconColor,
        other.successIconColor,
        t,
      ),
      warningIconColor: Color.lerp(
        warningIconColor,
        other.warningIconColor,
        t,
      ),
      errorIconColor: Color.lerp(
        errorIconColor,
        other.errorIconColor,
        t,
      ),
      notificationIconColor: Color.lerp(
        notificationIconColor,
        other.notificationIconColor,
        t,
      ),
      successBackgroundColor: Color.lerp(
        successBackgroundColor,
        other.successBackgroundColor,
        t,
      ),
      warningBackgroundColor: Color.lerp(
        warningBackgroundColor,
        other.warningBackgroundColor,
        t,
      ),
      errorBackgroundColor: Color.lerp(
        errorBackgroundColor,
        other.errorBackgroundColor,
        t,
      ),
      notificationBackgroundColor: Color.lerp(
        notificationBackgroundColor,
        other.notificationBackgroundColor,
        t,
      ),
      successTextStyle: TextStyle.lerp(
        successTextStyle,
        other.successTextStyle,
        t,
      ),
      warningTextStyle: TextStyle.lerp(
        warningTextStyle,
        other.warningTextStyle,
        t,
      ),
      errorTextStyle: TextStyle.lerp(
        errorTextStyle,
        other.errorTextStyle,
        t,
      ),
      notificationTextStyle: TextStyle.lerp(
        notificationTextStyle,
        other.notificationTextStyle,
        t,
      ),
      borderRadius: BorderRadiusGeometry.lerp(
        borderRadius,
        other.borderRadius,
        t,
      ),
      boxShadow: BoxShadow.lerpList(
        boxShadow,
        other.boxShadow,
        t,
      ),
      iconSize: lerpDouble(
        iconSize,
        other.iconSize,
        t,
      ),
      successIcon: successIcon,
      warningIcon: warningIcon,
      errorIcon: errorIcon,
      notificationIcon: notificationIcon,
    );
  }
}
