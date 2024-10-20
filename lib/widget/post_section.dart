import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_media_app/post.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  final List<Map<int, List<String>>> _postComments = [];
  final List<bool> _isCommentSectionOpen = [];

  @override
  void initState() {
    super.initState();
    _postComments.addAll(List.generate(posts.length, (index) => {index: []}));
    _isCommentSectionOpen.addAll(List.generate(posts.length, (index) => false));
  }

  void _addComment(int postIndex, String comment) {
    setState(() {
      _postComments[postIndex][postIndex]?.add(comment);
    });
  }

  void _toggleCommentSection(int postIndex) {
    setState(() {
      _isCommentSectionOpen[postIndex] = !_isCommentSectionOpen[postIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                final comments = _postComments[index][index] ?? [];
                return Container(
                  color: const Color(0xFF1A242F),
                  child: Card(
                    color: Colors.white,
                    margin: const EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 8,
                    shadowColor: Colors.black45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPostHeader(screenWidth, post),
                        _buildPostContent(screenWidth, screenHeight, isLandscape, post),
                        const Divider(),
                        _buildPostActions(screenWidth, post, comments, index),
                        if (_isCommentSectionOpen[index])
                          _buildCommentSection(index, comments),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostHeader(double screenWidth, Post post) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: screenWidth * 0.1 / 2,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: Image.asset(
                post.userAvatar,
                fit: BoxFit.cover,
                width: screenWidth * 0.1,
                height: screenWidth * 0.1,
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
          Text(
            post.username,
            style: TextStyle(color: Colors.black, fontSize: screenWidth * 0.04),
          ),
          const Spacer(),
          Text(
            post.timestamp,
            style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.03),
          ),
        ],
      ),
    );
  }

  Widget _buildPostContent(double screenWidth, double screenHeight, bool isLandscape, Post post) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (post.content.isNotEmpty)
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Text(
              post.content,
              style: TextStyle(color: Colors.black, fontSize: screenWidth * 0.04),
            ),
          ),
        if (post.imageUrl.isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              post.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: isLandscape ? screenHeight * 0.3 : screenHeight * 0.4,
            ),
          ),
      ],
    );
  }

  Widget _buildPostActions(double screenWidth, Post post, List<String> comments, int index) {
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.02),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/ic_round-favorite-border.svg',
            width: screenWidth * 0.06,
            height: screenWidth * 0.06,
            color: Colors.redAccent,
          ),
          SizedBox(width: screenWidth * 0.02),
          Text(
            "${post.likes}",
            style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.04),
          ),
          SizedBox(width: screenWidth * 0.09),
          GestureDetector(
            onTap: () => _toggleCommentSection(index),
            child: SvgPicture.asset(
              'assets/fa-regular_comment-dots.svg',
              width: screenWidth * 0.06,
              height: screenWidth * 0.06,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
          Text(
            "${comments.length}",
            style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.04),
          ),
          const Spacer(),
          SvgPicture.asset(
            'assets/bx_bookmark-alt.svg',
            width: screenWidth * 0.06,
            height: screenWidth * 0.06,
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildCommentSection(int postIndex, List<String> comments) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          ...comments.map((comment) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    const Icon(Icons.comment, color: Colors.blue, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        comment,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        _addComment(postIndex, value);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Add a comment...",
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blueAccent),
                  onPressed: () {
                    final controller = TextEditingController();
                    if (controller.text.isNotEmpty) {
                      _addComment(postIndex, controller.text);
                      controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
