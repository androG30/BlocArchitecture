import 'dart:convert';

import 'package:flutter_app/data/models/photos.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class PhotoRepository {
  Future<List<Photos>> getPhotos();
}

class PhotoRepositoryImpl extends PhotoRepository {
  static const String _baseUrl="jsonplaceholder.typicode.com";
  static const String _getalbum="/photos";
  @override
  Future<List<Photos>> getPhotos() async {
    Uri uri = Uri.https(_baseUrl, _getalbum);
    Response response = await http.get(uri);
    if (response.statusCode == 200) {
      List<Photos> photos = photosFromJson(response.body);
      return photos;
    } else {
      throw Exception('Failed');
    }
  }
}