import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:plant_store_app/widgets/groups_widget.dart';
import 'package:plant_store_app/widgets/plant_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int groupSelectedIndex = 0;

  Widget _getDefaultVerticalSpace() {
    return SliverToBoxAdapter(
      child: SizedBox(height: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    double horizontalPadding = width * 0.04;

    int plantCount = 10;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: height * 0.03)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person),
                      backgroundColor: Colors.grey.shade300,
                      foregroundColor: Colors.grey,
                      radius: 22,
                    ),
                    SizedBox(width: width * 0.03),
                    Column(
                      children: [
                        Text(
                          'Good Morning 👋',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Andrew Ramsey',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.notifications_outlined),
                        Icon(Icons.favorite_outline),
                      ],
                    )
                  ],
                ),
              ),
            ),
            _getDefaultVerticalSpace(),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              sliver: SliverToBoxAdapter(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    suffixIcon: Icon(
                      Icons.launch,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
            _getDefaultVerticalSpace(),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    Text(
                      'Special Offers',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
            ),
            _getDefaultVerticalSpace(),
            SliverPadding(
              padding: EdgeInsets.only(left: horizontalPadding),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  height: height * 0.4,
                  child: ListView.separated(
                    itemCount: plantCount,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => PlantWidget(
                      screenWidth: width,
                      screenHeight: height,
                      imageUrl: 'images/plant_$index.png',
                      name: lorem(paragraphs: 1, words: 1) + ' Plant',
                      price: 10 + Random().nextInt(80),
                      rating: Random().nextDouble() * 5,
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      width: horizontalPadding,
                    ),
                  ),
                ),
              ),
            ),
            _getDefaultVerticalSpace(),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    Text(
                      'Most Popular',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
            ),
            _getDefaultVerticalSpace(),
            SliverPadding(
              padding: EdgeInsets.only(left: horizontalPadding),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  height: height * 0.04,
                  child: GroupsWidget(
                    screenWidth: width,
                  ),
                ),
              ),
            ),
            _getDefaultVerticalSpace(),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              sliver: SliverGrid.builder(
                itemCount: 2,
                itemBuilder: (context, index) => PlantWidget(
                  screenWidth: width,
                  screenHeight: height,
                  imageUrl: 'images/plant_${9 - index}.png',
                  name: lorem(paragraphs: 1, words: 1) + ' Plant',
                  price: 10 + Random().nextInt(80),
                  rating: Random().nextDouble() * 5,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: horizontalPadding,
                  crossAxisSpacing: horizontalPadding,
                  childAspectRatio: 0.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
