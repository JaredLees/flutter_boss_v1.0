
import '../../domain/notice/notice_repository.dart';

/// msg repository
class Repository {

  final bool _prod;

  Repository(this._prod);

  NoticeRepository getNoticeRepository(){
    return new NoticeRepository(_prod);
  }

}