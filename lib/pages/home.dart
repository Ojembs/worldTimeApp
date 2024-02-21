import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map timeData = {};

  @override
  Widget build(BuildContext context) {
    timeData = timeData.isNotEmpty ? timeData : ModalRoute.of(context)!.settings.arguments as Map;
    // print(timeData['isDayTime']);
    String bgImage = timeData['isDayTime']
        ? 'https://images.unsplash.com/photo-1595903235950-dc7ea6b7702a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGRheSUyMHRpbWV8ZW58MHwxfDB8fHww'
        : 'https://images.unsplash.com/photo-1529440701349-739a457dbcdd?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bmlnaHQlMjB0aW1lfGVufDB8MXwwfHx8MA%3D%3D';

    Color? bgColor = timeData['isDayTime'] ? Colors.blueGrey : Colors.deepOrange;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(bgImage),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 90.0, 0.0, 0.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextButton.icon(
                      onPressed: () async{
                        dynamic res = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          timeData = {...res};
                        });
                      },
                      icon: Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey[800]
                      ),
                      label: Text(
                        'Choose location',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        timeData['location'],
                        style: const TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        )
                      )
                    ],
                  ),

                  const SizedBox(height: 20.0),

                  Text(
                    timeData['time'],
                    style: const TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    )
                  )
                ],
              ),
            ),
          )
      )
    );
  }
}
