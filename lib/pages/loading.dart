import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'Loading...';

  void setupWorldTime() async {
    WorldTime timeInstance = WorldTime(location: 'Berlin', flag: '', url: 'Europe/London');
    await timeInstance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': timeInstance.location,
      'flag': timeInstance.flag,
      'time': timeInstance.time,
      'isDayTime': timeInstance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(time)
      )
    );
  }
}
