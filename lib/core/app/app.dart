import 'package:flutter/material.dart';
import 'package:flutter_arch_example_riverpod/core/global_providers/global_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArchExampleApp extends HookConsumerWidget {
  const ArchExampleApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Listener(
      onPointerDown: (_) {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp.router(
        routerDelegate: ref.read(routerProvider).delegate(),
        routeInformationParser: ref.read(routerProvider).defaultRouteParser(),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}