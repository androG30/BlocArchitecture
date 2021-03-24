import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/data/models/photos.dart';

Widget buildHintsList(List<Photos> photos) {
  return Container(
    child: new ListView.builder(
        itemCount: photos.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 90,
                      width: 100,
                      child: Image.network(photos[index].thumbnailUrl)),
                  // SizedBox(height: 30),
                  Text(photos[index].title),
                ],
              ),
            ),
          );
        }),
  );
}