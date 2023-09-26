import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          buildNavHeader(),
          const Divider(color: Colors.grey),
          buildDrawerItems(
              Icons.tv,
              'Most Popular Tv Shows',
              Get.currentRoute == '/' ? Colors.blue : Colors.white,
              Get.currentRoute == '/' ? Colors.white : Colors.black, () {
            Get.toNamed('/');
          }),
          const Divider(color: Colors.grey),
          buildDrawerItems(
              Icons.radio,
              'Most Popular Radio Shows',
              Get.currentRoute == '/radioShows' ? Colors.blue : Colors.white,
              Get.currentRoute == '/radioShows' ? Colors.white : Colors.black,
              () {
            Get.toNamed('/radioShows');
          }),
        ],
      ),
    );
  }

  buildNavHeader() {
    return const UserAccountsDrawerHeader(
      accountName: Text('Health Center'),
      accountEmail: Text('health@gmail.com'),
      currentAccountPicture:
          CircleAvatar(backgroundColor: Colors.white, child: Text('MTK')),
      currentAccountPictureSize: Size.square(72),
      otherAccountsPictures: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('HC'),
        )
      ],
      otherAccountsPicturesSize: Size.square(50),
    );
  }

  buildDrawerItems(IconData iconData, String title, Color tileColor,
      Color textColor, Function() onTapTile) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      tileColor: tileColor,
      onTap: onTapTile,
    );
  }
}
