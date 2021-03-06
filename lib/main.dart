import 'package:flutter/material.dart';
import 'package:flutter_app/data/repositories/PhotoRepository.dart';
import 'package:flutter_app/photoBlock/photo_bloc.dart';
import 'package:flutter_app/screens/photo_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
          create: (context) => PhotoBloc(photoRepository: PhotoRepositoryImpl()),
          child: PhotoScreen()),
    );
  }
}

