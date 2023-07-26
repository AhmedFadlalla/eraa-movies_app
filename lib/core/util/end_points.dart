class EndPoints{
  static const baseUrl="https://api.themoviedb.org/3";
  static const apiKey="a674e3861f0ebf3d4563910dbabfbda5";
  static const nowPlayingMoviesPath=
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const popularMoviesPath="$baseUrl/movie/popular?api_key=$apiKey";

  static const topRatedMoviesPath="$baseUrl/movie/top_rated?api_key=$apiKey&language=en-US&page=1";

  static const baseImageUrl="https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path)=>"$baseImageUrl/$path";

  static String movieDetails(int id)=>"$baseUrl/movie/$id?api_key=$apiKey";

  static String moviesRecommendation(int id)=>"$baseUrl/movie/$id/recommendations?api_key=$apiKey";
}