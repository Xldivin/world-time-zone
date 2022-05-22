import 'package:different_time_zones/services/world_time.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'uk.jpeg', url: 'Europe/London'),
    WorldTime(location: 'Berlin', flag: 'uk.jpeg', url: 'Europe/Berlin'),
    WorldTime(location: 'Kigali', flag: 'uk.jpeg', url: 'Africa/Kigali'),
    WorldTime(location: 'Nairobi', flag: 'uk.jpeg', url: 'Africa/Nairobi'),
    WorldTime(location: 'Chicago', flag: 'uk.jpeg', url: 'America/Chicago')
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getData();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('choose a location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].location),
            ),
          );
        },
      ),
    );
  }
}
