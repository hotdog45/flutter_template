import 'package:intl/intl.dart';


class DateTimeUtils {
  static String dateFormat(String dateStr,{format = "yyyy年MM月dd日"}) {

    if(dateStr==null){
      return  "";
    }

    var date = DateTime.parse(dateStr);
    var timeStr = DateFormat(format).format(date);
    return timeStr;
  }
  static String dateFormatMillisecondsSince(String createTime,{format = "yyyy-MM-dd"}) {
    var date = DateTime.fromMillisecondsSinceEpoch(
        int.parse(createTime));
    var timeStr = DateFormat(format).format(date);
    return timeStr;
  }

  static String dateFormatByTime(DateTime time,{format = "MM月dd日 hh:mm:ss"}) {

    var timeStr = DateFormat(format).format(time);
    return timeStr;
  }

  static String dateFormatByString(String time,{inFormat="yyyy-MM-dd'T'HH:mm:ss.SSSXXX", outFormat = "MM月dd日 hh:mm:ss"}) {

    ///2021-02-21T15:05:34.000+0000
    DateFormat inputFormat = DateFormat(inFormat);
    DateTime dateTime = inputFormat.parse(time);
    DateFormat outputFormat = DateFormat(outFormat);
    String dateInString = outputFormat.format(dateTime); //  20:59:59
    return dateInString;
  }

}