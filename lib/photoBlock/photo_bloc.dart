import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/data/models/photos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/data/repositories/PhotoRepository.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoRepository photoRepository;

  PhotoBloc({@required this.photoRepository}) : super(null);

  PhotoState get initialState => PhotoInitial();

  @override
  Stream<PhotoState> mapEventToState(PhotoEvent event) async* {
    if (event is FetchPhotoEvent) {
      yield PhotoLoadingState();
      try {
        List<Photos> photos = await photoRepository.getPhotos();
        yield PhotoLoadedState(photos: photos);
      } catch (e) {
        yield PhotoErrorState(message: e.toString());
      }
    }
  }
}
