import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/pages/product_filtered_page.dart';
import 'package:frontend/pages/home_page.dart';
import 'package:frontend/molecules/vertical_list.dart';
import 'package:frontend/pages/scrapbook_page.dart';
import 'package:frontend/molecules/ranking.dart';
import 'package:frontend/pages/login_page.dart';
import 'package:frontend/pages/singin_page.dart';
import 'package:frontend/molecules/horizontal_list.dart';
import 'package:frontend/pages/side_scroll_page.dart';
import 'package:frontend/pages/product_list_page.dart';


void main() => runApp(const MyApp());

/// The route configuration.
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'listpage',
          builder: (BuildContext context, GoRouterState state) {
            return ListPage();
          },
        ),
        GoRoute(
          path: 'scrapbook',
          builder: (BuildContext context, GoRouterState state) {
            return ScrapBook();
          },
        ),
        GoRoute(
          path: 'rank',
          builder: (BuildContext context, GoRouterState state) {
            return Rank();
          },
        ),
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return Login();
          },
        ),
        GoRoute(
          path: 'singin',
          builder: (BuildContext context, GoRouterState state) {
            return Singin();
          },
        ),
        GoRoute(
          path: 'side_scroll_page',
          builder: (BuildContext context, GoRouterState state) {
            return SideScrollPage();
          },
        ),
        GoRoute(
          path: 'firstlist',
          builder: (BuildContext context, GoRouterState state) {
            return FirstList();
          },
        )

      ],
    ),
  ],
);

/// The main app.
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
