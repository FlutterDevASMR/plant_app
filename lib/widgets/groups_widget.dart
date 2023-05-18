import 'package:flutter/material.dart';

class GroupsWidget extends StatefulWidget {
  GroupsWidget({super.key, required this.screenWidth});

  double screenWidth;

  @override
  State<GroupsWidget> createState() => _GroupsWidgetState();
}

class _GroupsWidgetState extends State<GroupsWidget> {
  int groupSelectedIndex = 0;

  List<String> groups = [
    'All',
    'Monstera',
    'Aloe',
    'palm',
    'Bambo',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groups.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => GestureDetector(
        child: Container(
          child: Center(
            child: Text(
              groups[index],
              style: TextStyle(
                color:
                    groupSelectedIndex == index ? Colors.white : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
            color:
                groupSelectedIndex == index ? Colors.green : Colors.transparent,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.only(right: widget.screenWidth * 0.02),
        ),
        onTap: () {
          setState(() {
            groupSelectedIndex = index;
          });
        },
      ),
    );
  }
}
