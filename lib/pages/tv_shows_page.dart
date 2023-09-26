import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_loader_state_mixin/widgets/nav_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import '../controllers/tv_shows_controller.dart';
import '../network/providers/api_provider.dart';
import '../repositories/tv_shows_repository.dart';

class TvShowsPage extends GetView<TvShowsController> {
  const TvShowsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => TvShowsController(TvShowsRepository(ApiProvider())));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tv Shows'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isConnected.value == true
            ? controller.obx(
                (stateData) => ListView.separated(
                  controller: controller.scrollController,
                  padding: const EdgeInsets.only(top: 10),
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(color: Colors.grey, thickness: 1);
                  },
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext buildContext, int itemIndex) {
                    return ListTile(
                      title: Text(
                        '${stateData[itemIndex].name}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Text(
                            'Country: ${stateData[itemIndex].country}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Status: ${stateData[itemIndex].status}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      leading: SizedBox(
                        width: 100,
                        height: 100,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              '${stateData[itemIndex].imageThumbnailPath}',
                          placeholder: (ctx, url) => const Center(
                            child: SkeletonAvatar(),
                          ),
                          errorWidget: (ctx, url, error) => const Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: stateData!.length,
                ),
                onLoading: SkeletonListView(),
                onError: (error) => Text(error.toString()),
                onEmpty: const Text('No Tv Shows Available'),
              )
            : const Center(
                child: Text(
                  'No Internet Connection',
                  style: TextStyle(fontSize: 18),
                ),
              ),
      ),
      drawer: const NavDrawer(),
    );
  }
}
