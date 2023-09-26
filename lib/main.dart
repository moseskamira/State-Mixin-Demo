import 'package:custom_loader_state_mixin/controllers/tv_shows_controller.dart';
import 'package:custom_loader_state_mixin/network/providers/api_provider.dart';
import 'package:custom_loader_state_mixin/repositories/tv_shows_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends GetView<TvShowsController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => TvShowsController(TvShowsRepository(ApiProvider())));
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo Home Page'),
        ),
        body: controller.obx((stateData) => ListView.separated(
              padding: EdgeInsets.only(top: 10),
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.grey,
                );
              },
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext buildContext, int itemIndex) {
                return ListTile(title: Text('${stateData[itemIndex].name}'));
              },
              itemCount: stateData!.length,
            )));
  }
}
