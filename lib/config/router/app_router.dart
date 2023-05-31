import 'package:cinemapedia/config/theme/app_theme.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

class AppRouter extends StatelessWidget {
  AppRouter({super.key});

  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/movie/:id',
        name: MovieScreen.name,
        builder: (context, state) {
          final movieId = state.pathParameters['id'] ?? 'no-id';

          return MovieScreen(
            movieId: movieId,
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          // Return the widget that implements the custom shell (in this case
          // using a BottomNavigationBar). The StatefulNavigationShell is passed
          // to be able access the state of the shell and to navigate to other
          // branches in a stateful way.
          return HomeScreen(childView: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _sectionANavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/',
                builder: (context, state) {
                  return const HomeView();
                },
                // routes: <RouteBase>[
                //   GoRoute(
                //     path: 'movie/:id',
                //     name: MovieScreen.name,
                //     builder: (context, state) {
                //       final movieId = state.pathParameters['id'] ?? 'no-id';

                //       return MovieScreen(
                //         movieId: movieId,
                //       );
                //     },
                //   ),
                // ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/favorites',
                builder: (context, state) {
                  return const FavoritesView();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      routerConfig: _router,
    );
  }
}

// final appRouter = GoRouter(
//   initialLocation: '/',
//   routes: [
//     ShellRoute(
//       builder: (context, state, child) {
//         return HomeScreen(
//           childView: child,
//         );
//       },
//       routes: [
//         GoRoute(
//           path: '/',
//           builder: (context, state) {
//             return const HomeView();
//           },
//           routes: [
//             GoRoute(
//               path: 'movie/:id',
//               name: MovieScreen.name,
//               builder: (context, state) {
//                 final movieId = state.pathParameters['id'] ?? 'no-id';

//                 return MovieScreen(
//                   movieId: movieId,
//                 );
//               },
//             ),
//           ],
//         ),
//         GoRoute(
//           path: '/favorites',
//           builder: (context, state) {
//             return const FavoritesView();
//           },
//         )
//       ],
//     ),
//   ],
// );
