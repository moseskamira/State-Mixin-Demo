import 'package:custom_loader_state_mixin/network/providers/api_provider.dart';

import '../interfaces/itv_shows_repository.dart';

class TvShowsRepository extends ITVShowsRepository {
  late final ApiProvider apiProvider;

  TvShowsRepository(this.apiProvider);

  @override
  Future<dynamic> getMostPopularTvShows() async {
    return await apiProvider.getMostPopularTvShow();
  }
}
