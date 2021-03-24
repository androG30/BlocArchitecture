part of 'photo_bloc.dart';

abstract class PhotoState extends Equatable {
  const PhotoState();
}

class PhotoInitial extends PhotoState {
  @override
  List<Object> get props => [];
}

class PhotoLoadingState extends PhotoState{
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class PhotoLoadedState extends PhotoState{
  List<Photos>photos;
  PhotoLoadedState({@required this.photos});
  @override
  List<Object> get props => null;
}

// ignore: must_be_immutable
class PhotoErrorState extends PhotoState {
  String message;
  PhotoErrorState({@required this.message});
  @override
  List<Object> get props => null;
}
