import 'package:flutter/material.dart';
import 'package:flutter_app/photoBlock/photo_bloc.dart';
import 'package:flutter_app/screens/photoelements/error.dart';
import 'package:flutter_app/screens/photoelements/list.dart';
import 'package:flutter_app/screens/photoelements/loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoScreen extends StatefulWidget {
  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  PhotoBloc photoBloc;

  @override
  void initState() {
    photoBloc = BlocProvider.of<PhotoBloc>(context);
    photoBloc.add(FetchPhotoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocBuilder<PhotoBloc, PhotoState>(builder: (context, state) {
          if (state is PhotoInitial) {
            return buildLoading();
          } else if (state is PhotoLoadingState) {
            return buildLoading();
          } else if (state is PhotoLoadedState) {
            return buildHintsList(state.photos);
          } else if (state is PhotoErrorState) {
            return buildError(state.message);
          }
          return buildLoading();
        }),
      ),
    );
  }
}
