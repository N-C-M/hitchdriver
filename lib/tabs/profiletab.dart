import 'package:cabdriver/datamodels/driver.dart';
import 'package:cabdriver/dataprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

/*class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Hello Profile'));
  }
}*/

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {

 


  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.times),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${Provider.of<AppData>(context).fullname}',
                    style:
                        _theme.textTheme.title.merge(TextStyle(fontSize: 20.0)),
                  ),
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1503249023995-51b0f3778ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"),
                  )
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Text('Name: ${Provider.of<AppData>(context).fullname}'),
              SizedBox(
                height: 15.0,
              ),
              Text('Mail: ${Provider.of<AppData>(context).mailvalue}'),
              SizedBox(
                height: 15.0,
              ),
              Text('Phone Number: ${Provider.of<AppData>(context).phone}'),
              SizedBox(
                height: 15.0,
              ),
              Text(
                "PREFERENCES : DRIVER",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.0,
                  color: Color(0xFF9CA4AA),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFD),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

