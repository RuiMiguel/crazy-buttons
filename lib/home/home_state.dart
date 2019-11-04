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
          renderSliverGridFuture() //renderSliverGridFuture()
        ],
      ),
    );
  }

  renderSliverGridFuture() => FutureBuilder(
      future: Utils.loadJsonFromFile("assets/data.json"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return printSliverGrid(snapshot);
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return printLoading();
        } else {
          return printError();
        }
      });

  printLoading() => SliverToBoxAdapter(
      child: SizedBox(
          height: 180,
          child: new Stack(
            children: <Widget>[
              Positioned(
                  top: 40.0,
                  left: 10.0,
                  right: 10.0,
                  child: Center(child: CircularProgressIndicator())),
              Positioned(
                  bottom: 40.0,
                  left: 10.0,
                  right: 10.0,
                  child: Center(
                      child: Text("Loading",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )))),
            ],
          )));

  printError() => SliverToBoxAdapter(
      child: SizedBox(
          height: 180,
          child: new Stack(
            children: <Widget>[
              Positioned(
                  bottom: 40.0,
                  left: 10.0,
                  right: 10.0,
                  child: Center(
                      child: Text("Error loading data",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                          )))),
            ],
          )));

  printSliverGrid(AsyncSnapshot snapshot) {
    var mediaItems = json.decode(snapshot.data.toString());

    if (snapshot.hasData) {
      return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
                var mediaItem = MediaItem.fromJson(mediaItems[index]);
                return mediaItemView(mediaItem);
          }, childCount: mediaItems.length));
    } else if (snapshot.hasError) {
      return printError();
    }
  }

  Widget mediaItemView(MediaItem mediaItem) => GestureDetector(
      onTap: () {
        Utils.playMedia(mediaItem.media);
      },
      child: Container(
        height: 150.0,
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
}
