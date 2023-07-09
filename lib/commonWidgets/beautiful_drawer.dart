import 'package:flutter/material.dart';

class DrawerItem {
  final IconData icon;
  final String title;
  final Function onTap;

  DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}

class BeautifulDrawer extends StatelessWidget {
  final String headerTitle;
  final String headerSubtitle;
  final dynamic headerImage;
  final List<DrawerItem> drawerItems;
  final Color mainColor;

  BeautifulDrawer({
    required this.headerTitle,
    required this.headerSubtitle,
    required this.headerImage,
    required this.drawerItems,
    this.mainColor = const Color.fromARGB(255, 131, 57, 0),
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: mainColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (headerImage is String) // if headerImage is a url
                  CircleAvatar(
                    backgroundImage: NetworkImage(headerImage),
                    radius: 30,
                  )
                else if (headerImage is IconData) // if headerImage is an icon
                  Icon(
                    headerImage,
                    size: 60,
                    color: Colors.white,
                  ),
                SizedBox(height: 8.0),
                Text(
                  headerTitle,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  headerSubtitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          ...drawerItems.map((item) {
            return ListTile(
              leading: Icon(item.icon, color: mainColor),
              title: Text(
                item.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: mainColor,
                ),
              ),
              onTap: () {
                item.onTap();
                Navigator.pop(context);
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
