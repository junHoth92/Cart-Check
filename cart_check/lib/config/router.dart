import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/home/home_screen.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/purchased/purchased_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/webview/webview_screen.dart';

final AppRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/cart',
      name: 'cart',
      builder: (context, state) => CartScreen(),
    ),
    GoRoute(
      path: '/purchased',
      name: 'purchased',
      builder: (context, state) => const PurchasedScreen(),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => SettingsScreen(),
    ),
    GoRoute(
      path: '/webview',
      name: 'webview',
      builder: (context, state) {
        final link = state.uri.queryParameters['url'];
        return WebViewScreen(url: link ?? '');
      },
    ),
  ],
);
