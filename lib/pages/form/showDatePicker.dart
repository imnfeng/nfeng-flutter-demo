import 'package:flutter/material.dart';

class ShowDateTimePickerPage extends StatefulWidget {
  const ShowDateTimePickerPage({super.key});

  @override
  State<ShowDateTimePickerPage> createState() => _ShowDateTimePickerPageState();
}

class _ShowDateTimePickerPageState extends State<ShowDateTimePickerPage> {
  late DateTime _dateTime = DateTime.now();
  late TimeOfDay _time = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${_dateTime.year}-${_dateTime.month}-${_dateTime.day}"),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
              onTap: () async {
                DateTime? d = await showDatePicker(
                  context: context,
                  initialDate: _dateTime,
                  firstDate: DateTime(1990, 1, 1),
                  lastDate: DateTime(2035, 1, 1),
                );
                if (d != null) {
                  setState(() {
                    _dateTime = d;
                  });
                }
              },
            ),
            const SizedBox(height: 40),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${_time.hour}-${_time.minute}"),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
              onTap: () async {
                TimeOfDay? timeDay = await showTimePicker(
                  context: context,
                  initialTime: _time,
                );
                setState(() {
                  _time = timeDay!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
