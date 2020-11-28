import 'package:cabdriver/globalvariabels.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatefulWidget {
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  double _height;
  double _width;

  String _setTime, _setDate;

  String _hour, _minute, _time;

  String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  TextEditingController textcontroller= new TextEditingController();
    TextEditingController textcontroller2= new TextEditingController();


  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Scaffold(
      
      body: Container(
        width: _width,
        height: _height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                /*Text(
                  'Choose Pickup Location',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 0.5),
                ),*/
                InkWell(
                  /*onTap: () {
                    _selectDate(context);
                  },*/
                  child: Container(
                    width: _width / 1.4,
                    height: _height / 12,
                    margin: EdgeInsets.only(top: 70),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: TextField(
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                     
                      controller: textcontroller,
                      
                      decoration: InputDecoration(
                          disabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                              hintText: 'Pickup Point',
                          contentPadding: EdgeInsets.only(top: 0.0)),
                    ),
                  ),
                ),
              ],
            ),

            Column(
              children: <Widget>[
                /*Text(
                  'Choose Destination',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5),
                ),*/
                InkWell(
                  /*onTap: () {
                    _selectDate(context);
                  },*/
                  child: Container(
                    width: _width / 1.4,
                    height: _height / 12,
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: TextField(
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                     
                      controller: textcontroller2,
                      
                      decoration: InputDecoration(
                          disabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                              hintText: 'Destination',
                          // labelText: 'Time',
                          contentPadding: EdgeInsets.only(top: 0.0)),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'Choose Date',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5),
                ),
                InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Container(
                    width: _width / 1.4,
                    height: _height / 12,
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: TextFormField(
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: _dateController,
                      onSaved: (String val) {
                        _setDate = val;
                      },
                      decoration: InputDecoration(
                          disabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          // labelText: 'Time',
                          contentPadding: EdgeInsets.only(top: 0.0)),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'Choose Time',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5),
                ),
                InkWell(
                  onTap: () {
                    _selectTime(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: _width / 1.4,
                    height: _height / 12,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: TextFormField(
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                      onSaved: (String val) {
                        _setTime = val;
                      },
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: _timeController,
                      decoration: InputDecoration(
                          disabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          // labelText: 'Time',
                          contentPadding: EdgeInsets.all(5)),
                    ),
                  ),
                ),
              ],
            ),

            MaterialButton(
                          
                          height: 60.0,
                          
                          minWidth: 80,
                          color: Colors.blueGrey,
                          onPressed: (
                          ) {
                            final snackBar = SnackBar(
            content: Center(child: Text(' Trip Scheduled Successfully !')),
            /*action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),*/     // ee sanm ittal undo avde tanne kodkam
          );

          // Find the Scaffold in the widget tree and use
          // it to show a SnackBar.
          Scaffold.of(context).showSnackBar(snackBar);

                            DatabaseReference schedule = FirebaseDatabase.instance.reference().child('schedule').push();
                          Map value ={
                            'pickpt':textcontroller.text,
                            'droppt':textcontroller2.text,
                            'date':_dateController.text,
                            'time':_timeController.text,
                            'driverphone':currentDriverInfo.phone,
                            'drivername':currentDriverInfo.fullName,
                            

                          };
                          schedule.set(value);
                          textcontroller.clear();
                          textcontroller2.clear();
                          
                          _dateController.clear();
                          _timeController.clear();
                          },
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
          ],
        ),
      ),
    );
  }
}
