import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fluttertube/api.dart';
import 'package:fluttertube/models/video.dart';

class VideosBloc extends BlocBase {

  Api api;
  List<Video> videos;

  final _videosController = StreamController<List<Video>>();
  Stream get outVideos => _videosController.stream;

  final _searchController = StreamController<String>();
  Sink get inSearch => _searchController.sink;

  VideosBloc() {
    api = Api();

    _searchController.stream.listen(_search);
  }

  void _search(String search) async {
    if (search != null) {
      _videosController.sink.add([]);
      videos = await api.search(search);
    }
    else {
      videos += await api.nextPage();
    }
    
    _videosController.sink.add(videos);
  }


  // @override
  // void addListener(listener) {
  //   // TODO: implement addListener
  // }

  @override
  void dispose() {
    super.dispose();
    _videosController.close();
    _searchController.close();
  }

  // @override
  // // TODO: implement hasListeners
  // bool get hasListeners => null;

  // @override
  // void notifyListeners() {
  //   // TODO: implement notifyListeners
  // }

  // @override
  // void removeListener(listener) {
  //   // TODO: implement removeListener
  // }

}