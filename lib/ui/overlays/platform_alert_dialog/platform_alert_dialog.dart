import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_arch_example_riverpod/ui/overlays/platform_alert_dialog/android/platform_alert_dialog_android.dart';
import 'package:flutter_arch_example_riverpod/ui/overlays/platform_alert_dialog/ios/platform_alert_dialog_ios.dart';

class PlatformAlertDialog extends StatelessWidget {

  const PlatformAlertDialog({super.key,
    required this.title,
    required this.content,
  });
  final String title, content;

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? PlatformAlertDialogAndroid(
            title: title,
            content: content,
          )
        : PlatformAlertDialogIos(
            title: title,
            content: content,
          );
  }
}
