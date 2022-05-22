import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
   String location;// location name for the ui
   late String time;//the time in that location
   String flag;//url to an asset flag icon
   String url;//location url for api endpoints
   late bool isDaytime;

   WorldTime({ required this.location,  required this.flag, required this.url});

   Future<void> getData() async {
      Response response = await get (Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //create datetime object

      DateTime today = DateTime.parse(datetime);
      today = today.add(Duration(hours: int.parse(offset)));

      isDaytime = today.hour > 6 && today.hour < 18 ? true: false;
      time = DateFormat.jm().format(today);
   }
}
