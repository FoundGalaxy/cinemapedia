import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
        GoRoute(
          path: '/home/:page',
          name: HomeScreen.name,
          builder: (context, state){
            final pageIndex = int.parse(state.pathParameters['page']??'0');
            return HomeScreen(pageIndex: pageIndex);
          },
          routes: [
            GoRoute(
                path: 'movie/:id',
                name: MovieScreen.name,
                builder: (contex, state) {
                  final movieId = state.pathParameters['id'] ?? 'no-id';

                  return MovieScreen(movieId: movieId);
                },
              ),
          ]
        ),

        GoRoute(
          path: '/',
          redirect: (_, __) => '/home/0',
          )
      ]

    );


    //Rutas padre hijo
    /*GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (contex, state) => const HomeScreen(childView: HomeView()),
      routes: [

          GoRoute(
        path: 'movie/:id',
        name: MovieScreen.name,
        builder: (contex, state) {
          final movieId = state.pathParameters['id'] ?? 'no-id';

          return MovieScreen(movieId: movieId);
        },
      ),
      ]
    ),*/