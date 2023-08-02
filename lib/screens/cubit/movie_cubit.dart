import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/core/util/dio.dart';
import 'package:movies_app/core/util/end_points.dart';
import 'package:movies_app/screens/model/movie_model.dart';

import '../model/movie_details_model.dart';
import 'movie_state.dart';


class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

 static MovieCubit get(context)=>BlocProvider.of(context);

MovieModel? nowPlayingMovieModel;
 Future<void> getNowPlayingData()
 async{
   emit(GetNowPlayingLoadingState());
  final response= await DioHelper.getData(
      url: EndPoints.nowPlayingMoviesPath);

  if(response.statusCode==200){
    print("data");
    nowPlayingMovieModel=MovieModel.fromJson(response.data);
    emit(GetNowPlayingSuccessState());
  }else{
    emit(GetNowPlayingErrorState(error: response.data['message']));
  }
 }
 MovieModel? popularMovieDataModel;
 Future <void> getPopularData()async{
   emit(GetPopularLoadingState());
   final response=await DioHelper.getData(
       url: EndPoints.popularMoviesPath);

   if(response.statusCode==200){
     popularMovieDataModel=MovieModel.fromJson(response.data);
     emit(GetPopularSuccessState());
   }else{
     emit(GetPopularErrorState(error: response.data['message']));
   }
 }

  MovieModel? topRatedDataModel;
 Future<void> getTopRatedData()async{
emit(GetTopRatedLoadingState());
   final response=await DioHelper.getData(
       url: EndPoints.topRatedMoviesPath);

   if(response.statusCode==200){
     topRatedDataModel=MovieModel.fromJson(response.data);
     emit(GetTopRatedSuccessState());
   }else{
     emit(GetTopRatedErrorState(error: response.data['message']));
   }
 }

  BaseMovieDetails? movieDetails;
 Future<void> getDetailsData({
  required int id
})async{
   emit(GetMovieDetailsDataLoadingState());
   final response=await DioHelper.getData(url: EndPoints.movieDetails(id));

   if(response.statusCode==200){
     movieDetails=BaseMovieDetails.fromJson(response.data);
     emit(GetMovieDetailsDataSuccessState());
   }else{
     emit(GetMovieDetailsDataErrorState(error: response.data['message']));
   }
 }

}
