part of 'lil_snack.dart';

/// Theme extension of [_LilSnackMessage].
@immutable
class LilSnackThemeExtension extends ThemeExtension<LilSnackThemeExtension> {
  /// Creates theme extension of [_LilSnackMessage].
  const LilSnackThemeExtension({
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

  @override
  LilSnackThemeExtension copyWith({
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
  }) =>
      LilSnackThemeExtension(
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
      );

  @override
  LilSnackThemeExtension lerp(LilSnackThemeExtension? other, double t) {
    if (other is! LilSnackThemeExtension) return this;
    return LilSnackThemeExtension(
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
    );
  }
}
