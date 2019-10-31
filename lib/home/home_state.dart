import 'dart:core';

import 'package:crazy_buttons/home/home_page.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class MediaItem {
  String name;
  Uri media;
  Uri image;
}

class HomeState extends State<HomePage> {
  /*List<MediaItem> _items;

  void List<MediaItem> loadItems() {

  }
  */

  @override
  void initState() {
    super.initState();
    //_items = loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          ///First sliver is the App Bar
          SliverAppBar(
            ///Properties of app bar
            backgroundColor: Colors.white,
            floating: false,
            pinned: true,
            expandedHeight: 200.0,

            ///Properties of the App Bar when it is expanded
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "EconoSounds by Gigigo",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              background: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.black26,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return itemView(index);
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget itemView(int index) => Container(
        height: 100.0,
        color: Utils.getRandomColor(),
        child: Center(
          child: Text(
            "ss",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 10.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
}
