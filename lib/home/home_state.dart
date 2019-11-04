import 'dart:convert';
import 'dart:core';

import 'package:crazy_buttons/home/home_page.dart';
import 'package:flutter/material.dart';

import '../utils.dart';
import 'media_model.dart';

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          ///First sliver is the App Bar
          SliverAppBar(
            floating: false,
            pinned: true,
            expandedHeight: 200.0,

            ///Properties of the App Bar when it is expanded
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "EconoSounds by Gigigo",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal),
              ),
              background: new Image(
                  image: new AssetImage("assets/images/morgado_tumbado.jpg"),
                  fit: BoxFit.fill),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return mediaItemView(index);
            }),
          ),
        ],
      ),
    );
  }

  Widget mediaItemView(int index) => FutureBuilder(
      future: Utils.loadJsonFromFile("assets/data.json"),
      builder: (context, snapshot) {
        var mediaItems = json.decode(snapshot.data.toString());

        return ListView.builder(
          itemCount: mediaItems == null ? 0 : mediaItems.length,
          itemBuilder: (context, index) {
            var mediaItem = MediaItem.fromJson(mediaItems[index]);

            if (snapshot.hasData) {
              return GestureDetector(
                  onTap: () {
                    Utils.playMedia(mediaItem.media);
                  },
                  child: Container(
                    height: 100.0,
                    color: Utils.getRandomColor(),
                    child: Center(
                      child: Text(
                        "${mediaItem.name}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ));
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}",
                  style: TextStyle(color: Colors.red));
            }
            return new CircularProgressIndicator();
          },
        );
      });
}
