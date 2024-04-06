# Lil Snack

Package for displaying messages to the user. You can set basic message styles and easily show beautiful
alerts to the user. You can also create your own unique alerts.

## Getting started

Add LilSnackThemeExtension to your theme. Fill in all parameters. Then wrap your app with LilSnackMessenger.

```dart
Widget build(BuildContext context) => MaterialApp(
  title: 'Lil Snack Example',
  theme: ThemeData.light().copyWith(
    extensions: [
      LilSnackThemeExtension(
        successIconColor: Colors.white,
        warningIconColor: Colors.white,
        errorIconColor: Colors.white,
        notificationIconColor: Colors.black,
        successBackgroundColor: Colors.green,
        warningBackgroundColor: Colors.deepOrange.shade300,
        errorBackgroundColor: Colors.red,
        notificationBackgroundColor: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
        boxShadow: null,
        iconSize: 24,
        successTextStyle: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        warningTextStyle: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        errorTextStyle: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        notificationTextStyle: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  ),
  home: const LilSnackMessenger(
    child: ExamplePage(),
  ),
);
```

## Usage

#### Default message

```dart
  /// Shows success message.
  void _showSuccess(BuildContext context) => LilSnackMessenger.of(context).show(
    const LilSnack(
      text: 'Success',
      type: LilSnackType.success,
    ),
  );
```

#### Custom message

```dart
  /// Shows custom message.
  void _showCustom(BuildContext context) => LilSnackMessenger.of(context).show(
        LilSnack(
          icon: const Icon(
            Icons.stream,
            color: Colors.white,
          ),
          content: const Text(
            'Stream started!',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          action: ElevatedButton(
            onPressed: () => LilSnackMessenger.of(context).hide(),
            child: const Text('Watch'),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.deepPurple.shade300,
            border: Border.all(
              color: Colors.grey.shade100,
              width: 0.5,
            ),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, -0.2),
                blurRadius: 1,
                spreadRadius: 0.5,
                color: Colors.black12,
              ),
              BoxShadow(
                offset: Offset(-0.2, -0.15),
                blurRadius: 1,
                spreadRadius: 0.5,
                color: Colors.black12,
              ),
              BoxShadow(
                offset: Offset(0.2, -0.15),
                blurRadius: 1,
                spreadRadius: 0.5,
                color: Colors.black12,
              ),
            ],
          ),
          type: LilSnackType.custom,
          position: LilSnackPosition.bottom,
          spaceBetweenIconAndMessage: 20,
          spaceBetweenMessageAndAction: 20,
          dismissible: false,
          animationBuilder: (context, lilSnack, animation) => AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Opacity(
              opacity: animation.value,
              child: child,
            ),
            child: lilSnack,
          ),
        ),
      );
```

## Additional information

For a better understanding of how to use the package, see the example app.
