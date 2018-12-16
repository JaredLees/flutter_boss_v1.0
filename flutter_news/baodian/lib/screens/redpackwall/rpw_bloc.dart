import 'dart:async';

import 'package:baodian/core/Injection/Injector.dart';
import 'package:baodian/core/bloc/bloc_provider.dart';
import 'package:baodian/domain/notice/notice_repository.dart';
import 'package:baodian/models/notice.dart';
import 'package:baodian/utils/http_util.dart';

///rpw bloc
class RpwBloc implements BlocBase {
  /// noticeSelect
  StreamController<Notice> _noticeSelectedController =
      StreamController<Notice>();
  Function(Notice) get noticeSelected => _noticeSelectedController.sink.add;

  /// anim
  StreamController<bool> _animController = StreamController<bool>();
  Function(bool) get changeAnim => _animController.sink.add;
  Stream<bool> get anim => _animController.stream;

  /// can see progress
  StreamController<bool> _progressController = StreamController<bool>();
  Function(bool) get visibleProgress => _progressController.sink.add;
  Stream<bool> get progress => _progressController.stream;

  /// can see error
  StreamController<bool> _errorController = StreamController<bool>();
  Function(bool) get visibleError => _errorController.sink.add;
  Stream<bool> get error => _errorController.stream;

  /// msg list
  StreamController<List<Notice>> _noticeController =
      StreamController<List<Notice>>();
  Function(List<Notice>) get addnoticies => _noticeController.sink.add;
  Stream<List<Notice>> get noticies => _noticeController.stream;

  /// msg detail
  StreamController<Notice> _showDetailController = StreamController<Notice>();
  Function(Notice) get showDetail => _showDetailController.sink.add;
  Stream<Notice> get detail => _showDetailController.stream;

  @override
  void dispose() {
    _progressController.close();
    _errorController.close();
    _noticeController.close();
    _animController.close();
    _showDetailController.close();
    _noticeSelectedController.close();
  }

  /// 消息模型
  Notice nSelected;

  /// 消息仓储
  NoticeRepository repository;

  RpwBloc() {
    repository = new Injector().repository.getNoticeRepository();

    _noticeSelectedController.stream.listen((notice) {
      nSelected = notice;
      print(notice.title);
    });
  }

  ///
  load() {
    visibleProgress(true);
    visibleError(false);

    repository.loadNews().then((news)=>showNews(news)).catchError((onError) => showImplError(onError));
  }

  clickShowDetail() {
    if (nSelected != null) {
      showDetail(nSelected);
    }
  }

  showNews(List<Notice> news) {
    nSelected = news[0];
    visibleProgress(false);
    addnoticies(news);
    changeAnim(true);
  }

  showImplError(onError) {
    print(onError);
    if (onError is FetchDataException) {
      print("codigo: ${onError.code()}");
    }
    visibleError(true);
    visibleProgress(false);
  }
}
