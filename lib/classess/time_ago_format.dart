import 'package:timeago/timeago.dart' as timeago;

class TimeAgoFormat {
  static String format({DateTime date}) {
    return timeago.format(date, allowFromNow: true, locale: 'en');
  }
}
