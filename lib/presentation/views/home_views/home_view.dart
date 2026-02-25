
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';


class HomeView extends ConsumerStatefulWidget {
  const HomeView();

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {

  @override
  void initState() {

    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
  }


  @override
  Widget build(BuildContext context) {

    final firstLoading = ref.watch(firstLoadingProvider);
    if(firstLoading) return const FullscreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideShowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upComingMovies = ref.watch(upComingMoviesProvider);

    return CustomScrollView(
      slivers: [

        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {

            return Column(
              children: [

                //const CustomAppbar(),
                
                MoviesSlideShow(
                  movies: slideShowMovies),
            
                MovieHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'En cines',
                  subTitle: 'Lunes 20',
                  loadNextPage: () => {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage()
                  },
                ),
            
                MovieHorizontalListview(
                  movies: upComingMovies,
                  title: 'Proximamente',
                  subTitle: 'Este mes',
                  loadNextPage: () => {
                    ref.read(upComingMoviesProvider.notifier).loadNextPage()
                  },
                ),
            
                MovieHorizontalListview(
                  movies: popularMovies,
                  title: 'Populares',
                  subTitle: 'Top',
                  loadNextPage: () => {
                    ref.read(popularMoviesProvider.notifier).loadNextPage()
                  },
                ),
            
                MovieHorizontalListview(
                  movies: topRatedMovies,
                  title: 'Mejor valoración',
                  //subTitle: 'Lunes 20',
                  loadNextPage: () => {
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage()
                  },
                ),

                SizedBox(
                  height: 12,
                )
            
              ],
            );
          },childCount: 1
          )),

      ]
      
    );

  }
}