import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media_app/widget/bottom_navigation_bar%20.dart';
import 'package:social_media_app/widget/highlighted_stories.dart';
import 'package:social_media_app/widget/post_section.dart';

import '../widget/app_drawer.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  /*  final screenWidth = MediaQuery.of(context).size.width;
   final screenHeight = MediaQuery.of(context).size.height;
   final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;*/
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
        title:  SvgPicture.asset("assets/Socially.svg"),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: SvgPicture.asset('assets/carbon_notification-filled.svg',
                width: 24 , 
                height: 24,
              ),
              onPressed: () {
               Scaffold.of(context).openDrawer(); 
              },
            );
          }
        ),
        backgroundColor: Color(0xFF1A242F), 
      ),
      backgroundColor: Color(0xFF1A242F),
      drawer: AppDrawer(),
      body: Container(
      color: Color(0xFF1A242F), 
        child: const Column(
          children: [
          HighlightedStories(),
            Expanded(
            child: PostWidget()),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex:0,onTap: (int ) {  },),
    );
  }
}













