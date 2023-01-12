import 'package:flutter/material.dart';

import '../resources/resources.dart';
import 'category_screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categoryData.length,
      child: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             '''Simple way to find
// Tasty food''',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//           ),
//           actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
//           bottom: PreferredSize(
//             preferredSize: const Size.fromHeight(30),
//             child: TabBar(
//               unselectedLabelColor: const Color.fromARGB(255, 181, 170, 165),
//               isScrollable: true,
//               labelColor: const Color.fromARGB(255, 222, 61, 104),
//               indicatorColor: Colors.white,
//               tabs: categoryData,
//             ),
//           ),
//         ),
        body: SafeArea(
          child: DefaultTabController(
            length: categoryData.length,
            child: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) => [
                SliverAppBar(
                  expandedHeight: 150,
                  elevation: 0,
                  flexibleSpace:
                      flexibleSpaceBar(title: 'Simple way to find Tasty food'),
                  actions: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
                  ],
                  floating: false,
                  pinned: true,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(20),
                    child: TabBar(
                      unselectedLabelColor:
                          const Color.fromARGB(255, 181, 170, 165),
                      isScrollable: true,
                      labelColor: const Color.fromARGB(255, 222, 61, 104),
                      indicatorColor: Colors.white,
                      tabs: categoryData,
                    ),
                  ),
                )
              ],
              body: TabBarView(children: [
                const AllFoodScreen(),
                gridView(data: pizzaData),
                gridView(data: sandwichData),
                gridView(data: burgerData),
                gridView(data: drinksData),
                gridView(data: friesData),
                gridView(data: milkShakeData),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

FlexibleSpaceBar flexibleSpaceBar({required String title}) {
  return FlexibleSpaceBar(
    titlePadding: const EdgeInsets.only(left: 10.0, bottom: 15),
    title: Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Text(title,
          maxLines: 2,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black)),
    ),
  );
}
