import 'package:custom_loader_state_mixin/pages/radio_shows_page.dart';
import 'package:custom_loader_state_mixin/pages/tv_shows_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: [
        GetPage(name: '/', page: () => const MyApp()),
        GetPage(name: '/tvShows', page: () => const TvShowsPage()),
        GetPage(name: '/radioShows', page: () => const RadioShowsPage()),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TvShowsPage(),
    );
  }
}
