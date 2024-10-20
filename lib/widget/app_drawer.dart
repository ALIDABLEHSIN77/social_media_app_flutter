import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app/route.dart';
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white10,  
            ),
            child: Image.asset("assets/Frame 411.png"),
          ),
          _createDrawerItem(
            icon: 'assets/ant-design_home-filled.png', 
            title: 'Home',
            onTap: () {
            
            },
          ),
          _createDrawerItem(
            icon: 'assets/carbon_explore.png', 
            title: 'Explore',
            onTap: () {
            Get.toNamed(route.GetExplorePage());
            },
          ),
          _createDrawerItem(
            icon: 'assets/carbon_user-avatar.png',
            title: 'Profile',
            onTap: () {
            },
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem({required String icon, required String title, required Function onTap}) {
    return ListTile(
      leading: Image.asset(
        icon,
        width: 24,  
        height: 24, 
      ),
      title: Text(title, style: TextStyle(color: Colors.black)),
      onTap: () => onTap(),
    );
  }
}