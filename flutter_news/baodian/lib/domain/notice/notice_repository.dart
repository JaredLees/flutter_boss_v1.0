import '../../config/constants.dart';
import '../../models/notice.dart';
import '../../utils/http_util.dart';

class NoticeRepository {
  final httpUtil = HttpUtil(urlBase: Constants.apiBeta);
  final bool _prod;

  NoticeRepository(this._prod);

  Future<List<Notice>> loadNews() async {
    return _prod ? _serverNews() : _localNews();
  }

  _serverNews() {
    List<Notice> listInfo = new List<Notice>();
    Notice model = Notice(
        '', 'title', 'date', 'description', 'category', 'link', 'origin');
    listInfo.addAll([model, model]);
    return listInfo;
  }

  _localNews() {
    return new List();
  }
}
