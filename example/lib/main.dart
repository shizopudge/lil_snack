import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lil_snack/lil_snack.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
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
}

@immutable
class ExamplePage extends StatelessWidget {
  const ExamplePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Lil Snack Example'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => _showSuccess(context),
                  child: const Text('"Success"'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                    onPressed: () => LilSnackMessenger.of(context).show(
                      LilSnack(
                        text: 'Success with action',
                        type: LilSnackType.success,
                        action: CupertinoButton(
                          onPressed: LilSnackMessenger.of(context).hide,
                          padding: EdgeInsets.zero,
                          minSize: 16,
                          child: const Text('Action'),
                        ),
                      ),
                    ),
                    child: const Text('"Success with action"'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                    onPressed: () => LilSnackMessenger.of(context).show(
                      const LilSnack(
                        text: 'Error',
                        type: LilSnackType.error,
                      ),
                    ),
                    child: const Text('"Error"'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                    onPressed: () => LilSnackMessenger.of(context).show(
                      const LilSnack(
                        text: 'Warning',
                        type: LilSnackType.warning,
                      ),
                    ),
                    child: const Text('"Warning"'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                    onPressed: () => LilSnackMessenger.of(context).show(
                      const LilSnack(
                        text: 'Notification',
                        type: LilSnackType.notification,
                      ),
                    ),
                    child: const Text('"Notification"'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                    onPressed: () => _showCustom(context),
                    child: const Text('"Custom"'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                    onPressed: LilSnackMessenger.of(context).hide,
                    child: const Text('Hide'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                    onPressed: LilSnackMessenger.of(context).removeAll,
                    child: const Text('Remove all'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  /// Shows success message.
  void _showSuccess(BuildContext context) => LilSnackMessenger.of(context).show(
        const LilSnack(
          text: 'Success',
          type: LilSnackType.success,
        ),
      );

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
}
