import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {

  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async{
    try {
      Response response = await http.get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = now.toString();
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

    } catch (e) {
      time = "Could not fetch time zone for selected area";
    }
  }
}