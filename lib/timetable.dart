import "package:flutter/widgets.dart";

import "session.dart";

class TimetableState extends State<TimetableController> {
  void getTimetable() async {
    try {
      final response = await Session.get(
        "http://35.244.66.186:8080/api/v1/timetable/Get"
      );

      print(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    getTimetable();
    return Text("Hello, World!");
  }
}

class TimetableController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TimetableState();
  }
}
