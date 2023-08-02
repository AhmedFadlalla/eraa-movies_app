
abstract class MovieState {}

class MovieInitial extends MovieState {}
class GetNowPlayingLoadingState extends MovieState{}
class GetNowPlayingSuccessState extends MovieState{}
class GetNowPlayingErrorState extends MovieState{
  final String error;

  GetNowPlayingErrorState({
    required this.error});
}

class GetPopularLoadingState extends MovieState{}
class GetPopularSuccessState extends MovieState{}
class GetPopularErrorState extends MovieState{
  final String error;

  GetPopularErrorState({
    required this.error});
}


class GetTopRatedLoadingState extends MovieState{}
class GetTopRatedSuccessState extends MovieState{}
class GetTopRatedErrorState extends MovieState{
  final String error;

  GetTopRatedErrorState({
    required this.error});
}

class GetMovieDetailsDataLoadingState extends MovieState{}
class GetMovieDetailsDataSuccessState extends MovieState{}
class GetMovieDetailsDataErrorState extends MovieState{
  final String error;

  GetMovieDetailsDataErrorState({
    required this.error});
}