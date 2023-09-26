import 'package:custom_loader_state_mixin/models/tv_show.dart';
import 'package:get/get.dart';

class RadioShowsController extends GetxController {
  List<TvShow> radioShows = [];

  @override
  void onInit() {
    super.onInit();
    loadRadiosList();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void loadRadiosList() {
    TvShow tvShow1 = TvShow(
        'PENDING', 'GIGENDA GITYA', null, null, 'AUS', null, null, null, null);
    TvShow tvShow2 =
        TvShow('LIVE', 'DEMBE TAXI', null, null, 'AUS', null, null, null, null);
    TvShow tvShow3 =
        TvShow('LIVE', 'MUBEEZI', null, null, 'AUS', null, null, null, null);
    TvShow tvShow4 = TvShow(
        'PENDING', 'EKILOVU LOVU', null, null, 'AUS', null, null, null, null);
    TvShow tvShow5 = TvShow(
        'LIVE', 'TALK & TALK SHOW', null, null, 'AUS', null, null, null, null);
    TvShow tvShow6 = TvShow(
        'PENDING', 'TALK SHOW', null, null, 'AUS', null, null, null, null);

    radioShows.add(tvShow1);
    radioShows.add(tvShow2);
    radioShows.add(tvShow3);
    radioShows.add(tvShow4);
    radioShows.add(tvShow5);
    radioShows.add(tvShow6);
  }
}
