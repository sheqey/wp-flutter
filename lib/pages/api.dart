import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/post_provider/provider.dart';
class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    super.initState();
    // Fetch posts when the widget is initialized
    Provider.of<PostProvider>(context, listen: false).fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    final posts = postProvider.posts;
    print(posts);

    print('Posts Length: ${posts.length}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: posts.isEmpty
          ? Center(
        child: postProvider.isLoading
            ? CircularProgressIndicator()
            : Text('No posts available'),
      )
          : ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          print('Post Title: ${post.title}');

          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.content),
            // Add more widgets to display other post data (e.g., fileUrl, date, author)
          );
        },
      ),
    );
  }
}
