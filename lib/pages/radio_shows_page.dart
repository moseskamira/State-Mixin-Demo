import 'package:custom_loader_state_mixin/controllers/radio_shows_controller.dart';
import 'package:custom_loader_state_mixin/models/tv_show.dart';
import 'package:custom_loader_state_mixin/widgets/nav_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioShowsPage extends GetView<RadioShowsController> {
  const RadioShowsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => RadioShowsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio Shows'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Search Radio Programme',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Autocomplete<TvShow>(
              optionsBuilder: (editingTextValue) => controller.radioShows
                  .where((TvShow tvShow) => tvShow.name!
                      .toLowerCase()
                      .startsWith(editingTextValue.text.toLowerCase()))
                  .toList(),
              displayStringForOption: (TvShow show) => show.name!,
              fieldViewBuilder: (BuildContext buildContext,
                  TextEditingController textEditingController,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted) {
                return TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Select Show',
                  ),
                  controller: textEditingController,
                  focusNode: focusNode,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                );
              },
              onSelected: (TvShow myTvShow) {
                Get.snackbar('You Selected', '${myTvShow.name}',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.blue,
                    colorText: Colors.white);
              },
            ),
          ),
        ],
      ),
      drawer: const NavDrawer(),
    );
  }
}
