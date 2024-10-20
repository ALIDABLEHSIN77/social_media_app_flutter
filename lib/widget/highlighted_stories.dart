import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';
import 'package:social_media_app/post.dart';




class HighlightedStories extends StatefulWidget {
  const HighlightedStories({super.key});

  @override
  _HighlightedStoriesState createState() => _HighlightedStoriesState();
}

class _HighlightedStoriesState extends State<HighlightedStories> {
  Set<int> viewedStories = {}; // لتتبع القصص التي تم عرضها

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF253341),
            Color(0xFF1B2836),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.all(4.0),
      child: SizedBox(
        height: isLandscape ? screenHeight * 0.1 : screenHeight * 0.1,
        width: screenWidth * 0.90,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: stories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  viewedStories.add(index); // نضيف القصة إلى القصص التي تم عرضها
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoryViewer(
                      stories: stories,
                      initialIndex: index,
                    ),
                  ),
                );
              },
              child: Container(
                width: isLandscape ? screenWidth * 0.1 : screenWidth * 0.15,
                margin: const EdgeInsets.symmetric(horizontal: 6.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: viewedStories.contains(index)
                        ? Colors.grey // لون الإطار بعد العرض
                        : Colors.blue, // لون الإطار قبل العرض
                    width: 2.0,
                  ),
                  image: DecorationImage(
                    image: AssetImage(stories[index].userAvatar),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class StoryViewer extends StatefulWidget {
  final List<Post> stories;
  final int initialIndex;

  const StoryViewer({
    Key? key,
    required this.stories,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  _StoryViewerState createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer> {
  PageController? _pageController;
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
    _currentIndex = widget.initialIndex;
    _startAutoProgress();
  }

  void _startAutoProgress() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentIndex < widget.stories.length - 1) {
        _pageController?.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        timer.cancel();
        Navigator.pop(context);
      }
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: widget.stories.length,
            itemBuilder: (context, index) {
              return Image.asset(
                widget.stories[index].imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),
          Positioned(
            top: 40.0,
            left: 16.0,
            right: 16.0,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.stories[_currentIndex].userAvatar),
                  radius: 16,
                ),
                const SizedBox(width: 8.0),
                Text(
                  widget.stories[_currentIndex].username,
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: 40.0,
            left: 16.0,
            right: 16.0,
            child: Row(
              children: List.generate(widget.stories.length, (index) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: index <= _currentIndex
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            bottom: 40.0,
            left: 16.0,
            child: Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset('assets/ic_round-favorite-border.svg',color: Colors.white,),
                  onPressed: () {
                    print("Liked the story!");
                  },
                ),
                const SizedBox(width: 16.0),
                IconButton(
                  icon: SvgPicture.asset('assets/fa-regular_comment-dots.svg',color: Colors.white,),
                  onPressed: () {
                    print("Comment button pressed!");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController?.dispose();
    _timer?.cancel();
    super.dispose();
  }
}
