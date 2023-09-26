import 'dart:async';
import 'package:custom_loader_state_mixin/models/tv_show_response.dart';
import 'package:custom_loader_state_mixin/repositories/tv_shows_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../models/tv_show.dart';

class TvShowsController extends GetxController with StateMixin<List<TvShow>> {
  late TvShowsRepository tvShowsRepository;

  TvShowsController(this.tvShowsRepository);

  late List<TvShow> tvShows;
  int pageNumber = 1;
  late ScrollController scrollController;
  var isMoreDataAvailable = true.obs;
  var isConnected = false.obs;
  late StreamSubscription<InternetConnectionStatus> _listener;

  @override
  void onInit() {
    super.onInit();
    paginateTask();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
    _listener.cancel();
  }

  void paginateTask() {
    scrollController = ScrollController();
    tvShows = [];
    _listener = InternetConnectionChecker()
        .onStatusChange
        .listen((InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          isConnected.value = true;
          getMostPopularTvShows('$pageNumber');
          break;
        case InternetConnectionStatus.disconnected:
          isConnected.value = false;
          break;
      }
    });
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        pageNumber += 1;
        getMostPopularTvShows('$pageNumber');
      } else if (scrollController.position.pixels ==
          scrollController.position.minScrollExtent) {
        if (pageNumber > 1) {
          pageNumber -= 1;
          getMostPopularTvShows('$pageNumber');
        }
      }
    });
  }

  void getMostPopularTvShows(String page) async {
    try {
      change(null, status: RxStatus.loading());
      tvShowsRepository.getMostPopularTvShows(page).then((value) {
        TvShowResponse tvShowResponse = TvShowResponse.fromJson(value);
        if (tvShowResponse.tvShows != null &&
            tvShowResponse.tvShows!.isNotEmpty) {
          tvShows.clear();
          tvShows.addAll(tvShowResponse.tvShows!);
          tvShows.toSet().toList();
          change(tvShows, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.error('No More TV Shows Available'));
        }
      }, onError: (error) {
        change(null, status: RxStatus.error(error.toString()));
      });
    } catch (exception) {
      change(null, status: RxStatus.error(exception.toString()));
    }
  }
}
