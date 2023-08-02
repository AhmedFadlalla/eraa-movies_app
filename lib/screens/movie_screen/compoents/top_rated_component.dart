import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/util/end_points.dart';
import 'package:movies_app/screens/cubit/movie_state.dart';
import 'package:shimmer/shimmer.dart';

import '../../cubit/movie_cubit.dart';
import '../details_screen.dart';


class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=MovieCubit.get(context);
        return cubit.topRatedDataModel!=null?
        FadeIn(
          duration: const Duration(milliseconds: 500),
          child: SizedBox(
            height: 170.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: 4,
              itemBuilder: (context, index) {
                // final movie = state.topRatedMovies[index];
                return Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetailScreen(id: cubit.topRatedDataModel!.results![index].id!)));
                    },
                    child: ClipRRect(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(8.0)),
                      child: CachedNetworkImage(
                        width: 120.0,
                        fit: BoxFit.cover,
                        imageUrl: EndPoints.imageUrl(
                            cubit.topRatedDataModel!.results![index].posterPath!
                        ),
                        placeholder: (context, url) =>
                            Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ):
        CircularProgressIndicator();
      },
    );
  }
}
