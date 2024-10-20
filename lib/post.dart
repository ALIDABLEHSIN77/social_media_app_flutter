class Post {
  final String username;
  final String userAvatar;
  final String content;
  final int likes;
  final int comments;
  final String imageUrl;
  final String timestamp;

  Post({
    required this.username,
    required this.userAvatar,
    required this.content,
    required this.likes,
    required this.comments,
     this.imageUrl ='',
    required this.timestamp,
  });
}
final List<Post> stories = [
  Post(
    username: "Kylie Jenner",
    userAvatar: "assets/1.png",
    content: "Story 1",
    likes: 10,
    comments: 5,
    imageUrl: "assets/1.png",
    timestamp: "5m ago",
  ),
  Post(
    username: "Alex Strohl",
    userAvatar: "assets/3.png",
    content: "Story 1",
    likes: 20,
    comments: 15,
    imageUrl: "assets/2.png",
    timestamp: "10m ago",
  ),
    Post(
    username: "Ali Dableh",
    userAvatar: "assets/5.png",
    content: "Story 1",
    likes: 20,
    comments: 15,
    imageUrl: "assets/5.png",
    timestamp: "10m ago",
  ),
    Post(
    username: "Sara Ahmed",
    userAvatar: "assets/7.png",
    content: "Story 1",
    likes: 20,
    comments: 15,
    imageUrl: "assets/7.png",
    timestamp: "10m ago",
  ),
    Post(
    username: "Ahmed Dabbagh",
    userAvatar: "assets/6.png",
    content: "Story 1",
    likes: 20,
    comments: 15,
    imageUrl: "assets/6.png",
    timestamp: "10m ago",
  ),
     Post(
    username: "Ahmed Dabbagh",
    userAvatar: "assets/3.png",
    content: "Story 1",
    likes: 20,
    comments: 15,
    imageUrl: "assets/6.png",
    timestamp: "10m ago",
  ),
];
final List<Post> posts = [
    Post(
      username: "Kylie Jenner",
      userAvatar: "assets/3.png", // Replace with your asset path
      content:
          "Stopped by @zoesugg today with goossey girl to see @kyliecosmetics & @kylieskin 💖 wow what a dream!!!!!! It’s the best experience we have!",
      likes: 1320,
      comments: 23, // Replace with your asset path
      timestamp: "2 days ago",
    ),
    Post(
      username: "Alex Strohl",
      userAvatar: "assets/1.png", // Replace with your asset path
      content: "",
      likes: 1020,
      comments: 15,
      imageUrl: "assets/I04.png", // Replace with your asset path
      timestamp: "1 hour ago",
    ),
      Post(
      username: "Ali Dableh",
      userAvatar: "assets/5.png", // Replace with your asset path
      content:
          "this ammm last ok thanks Good Good ! ",
      likes: 100,
      comments: 22, // Replace with your asset path
      timestamp: "2 days ago",
    ),
         Post(
      username: "Rama Dableh",
      userAvatar: "assets/7.png", // Replace with your asset path
      content:
          "this ammm last ok thanks Good Good ! ",
      likes: 100,
      comments: 22, // Replace with your asset path
      timestamp: "2 days ago",
    ),
  ];