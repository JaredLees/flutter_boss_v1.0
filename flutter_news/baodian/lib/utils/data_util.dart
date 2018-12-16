
class DateUtil{

  var mouths =['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'];

  String buildDate(String date){

    try{
      var datatime = DateTime.parse(date);
      return "${datatime.year}-${mouths[datatime.month-1]}-${datatime.day} ${datatime.hour}:${datatime.minute}";
    }catch(e){
      return "";
    }

  }
}