import 'package:dro_health_home_task/pages/categories_page.dart';
import 'package:dro_health_home_task/pages/home_page.dart';
import 'package:dro_health_home_task/pages/search_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",

      onGenerateRoute: (RouteSettings settings) {
        final String? routeName = settings.name;
        switch (routeName) {
          case "/home":
            return MaterialPageRoute(builder: (context) {
              return const HomePage();
            });
          case "/search_page":
            return MaterialPageRoute(builder: (context) {
              final searchTerm = settings.arguments.toString();
              return SearchPage(
                searchTerm: searchTerm,
              );
            });
          case "/all_categories":
            return MaterialPageRoute(builder: (context) {
              return const CategoriesPage();
            });
        }
      },
      theme: ThemeData(primarySwatch: Colors.purple, fontFamily: "Proxima"),
      // home: const HomePage(),
    );
  }
}
