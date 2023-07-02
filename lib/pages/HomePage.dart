import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wp_to_flutter/pages/article.dart';
import 'package:wp_to_flutter/widgets/appbar.dart';
import 'package:wp_to_flutter/widgets/appdrawer.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:wp_to_flutter/widgets/featured.dart';
import '../provider/post_provider/category/provider.dart';
import '../provider/post_provider/provider.dart';
import '../widgets/prev.dart';
class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    // Call fetchPosts() only if the posts are not already loaded
    if (postProvider.posts.isEmpty && !postProvider.isLoading) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        postProvider.fetchPosts();
        categoryProvider.fetchCategories();
      });
    }
    // Call fetchPosts() only if the posts are not already loaded


    return Scaffold(
      appBar: Appba(),

      drawer: appdrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [

              Consumer<CategoryProvider>(
                builder: (context, categoryProvider, _) {
                  if (categoryProvider.categories.isEmpty) {
                    return CircularProgressIndicator(); // Display a loading indicator while loading categories
                  } else {
                    final firstPost = postProvider.posts.isNotEmpty ? postProvider.posts[0] : null;
                    final header = firstPost?.title ?? '';
                    final desc = firstPost?.content ?? '';
                    final imgurl = firstPost?.fileUrl ?? '';

                    return Column(
                      children: [
                        Featured(
                          imgurl: imgurl,
                        ),
                        description(
                          desc: desc,
                          header: header,
                          hight: 10.0,
                        ),
                      ],
                    );
                  }
                },
              ),



              Consumer<CategoryProvider>(
                builder: (context, categoryProvider, _) {
                  if (categoryProvider.categories.isEmpty) {
                    return CircularProgressIndicator(); // Display a loading indicator while loading categories
                  } else {
                    categoryProvider.categories.sort((a, b) {
                      final categoryAPosts = postProvider.posts.where((post) => post.categories.contains(a)).toList();
                      final categoryBPosts = postProvider.posts.where((post) => post.categories.contains(b)).toList();
                      return categoryBPosts.length.compareTo(categoryAPosts.length);
                    });
                    return Container(
                      height: MediaQuery.of(context).size.height, // Set a fixed height constraint
                      child: DefaultTabController(
                        length: categoryProvider.categories.length,
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: TabBar(
                                isScrollable: true, // Enable scrollable tabs
                                tabs: categoryProvider.categories.map((category) => Tab(text: category)).toList(),
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                children: categoryProvider.categories.map((category) {
                                  // Use the category to filter posts or perform other logic
                                  final filteredPosts = postProvider.posts.where((post) => post.categories.contains(category)).toList();

                                  return ListView.builder(
                                    itemCount: filteredPosts.length,
                                    itemBuilder: (context, index) {
                                      final post = filteredPosts[index];
                                      return GestureDetector(
                                        onTap: () {
                                          // Navigate to ArticlePage with post data
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Article(
                                                title: post.title,
                                                content: post.content,
                                                author: post.author,
                                                date: post.date,
                                                imgurl: post.fileUrl,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Preview(
                                          purl: post.fileUrl,
                                          prevh: post.title,
                                          prevd: '${post.categories.join(", ")}',
                                          pdate: timeago.format(DateTime.parse(post.date)),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              )





            ],
          ),
        ),
      ),
    );
  }
}
