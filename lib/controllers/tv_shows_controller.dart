import 'package:custom_loader_state_mixin/models/tv_show_response.dart';
import 'package:custom_loader_state_mixin/repositories/tv_shows_repository.dart';
import 'package:get/get.dart';
import '../models/tv_show.dart';

class TvShowsController extends GetxController with StateMixin<dynamic> {
  late TvShowsRepository tvShowsRepository;

  TvShowsController(this.tvShowsRepository);

  List<TvShow> tvShows = [];

  @override
  void onInit() {
    super.onInit();
    getMostPopularTvShows();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void getMostPopularTvShows() async {
    try {
      change(null, status: RxStatus.loading());
      tvShowsRepository.getMostPopularTvShows().then((value) {
        TvShowResponse tvShowResponse = TvShowResponse.fromJson(value);
        if (tvShowResponse.tvShows != null) {
          tvShows.clear();
          tvShows.addAll(tvShowResponse.tvShows!);
          change(tvShows, status: RxStatus.success());
        }
      }, onError: (error) {
        change(null, status: RxStatus.error(error.toString()));
      });
    } catch (exception) {
      change(null, status: RxStatus.error(exception.toString()));
    }
  }
}
