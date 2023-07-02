import 'package:flutter/material.dart';
import 'package:wp_to_flutter/pages/HomePage.dart';
import 'package:wp_to_flutter/pages/api.dart';
import 'package:wp_to_flutter/pages/article.dart';
import 'package:wp_to_flutter/pages/testpage.dart';
import 'package:wp_to_flutter/provider/post_provider/provider.dart';
import 'package:provider/provider.dart';

import 'provider/post_provider/category/provider.dart';

Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();

  //final postProvider = PostProvider();
 // await postProvider.fetchPosts();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostProvider>(
          create: (context) => PostProvider(),
        ),
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: {
          '/politics': (context) => const home(),
          '/home': (context) => HomePage(title: 'home page'),
          //'/article': (context) => Article(),
          // Add more routes for your app
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home:HomePage(title: 'switch news'),
      ),
    );
  }
}

