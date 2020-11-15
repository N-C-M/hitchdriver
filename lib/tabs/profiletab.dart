import 'package:cabdriver/datamodels/driver.dart';
import 'package:cabdriver/dataprovider.dart';
import 'package:cabdriver/screens/login.dart';
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
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> logOut() async {
    FirebaseUser user = auth.signOut() as FirebaseUser;
  }

 


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://prod.cdn.earlygame.com/uploads/images/_imageBlock/Valorant-Jett-artwork.jpg?mtime=20200527162418&focal=none&tmtime=20201005083153'),
            ),
            Text('${Provider.of<AppData>(context).fullname}',
                style: GoogleFonts.pacifico(
                    fontSize: 25,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold)),
            Text(
              'Driver Mode',
              style: GoogleFonts.sourceSansPro(
                  fontSize: 20,
                  color: Colors.teal[60],
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
              width: 200,
              child: Divider(
                color: Colors.blueGrey,
              ),
            ),
            InfoCard(
              text: '${Provider.of<AppData>(context).phone}',
              icon: Icons.phone,
              onPressed: () {},
            ),
            InfoCard(
              text: '${Provider.of<AppData>(context).mailvalue}',
              icon: Icons.email,
              onPressed: () {},
            ),
            SizedBox(height:20),
            RaisedButton(
              padding: EdgeInsets.all(8),
              color: Colors.blueGrey,
              child: const Text('Sign Out', style: TextStyle( color: Colors.white)),
              onPressed: (){
                logOut();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => LoginPage()));

              

            }
            
            )
            /*InfoCard(
              text: 'than aaruva?',
              icon: Icons.web,
              onPressed: () {},
            ),
            InfoCard(
              text: 'enthelum venel ida',
              icon: Icons.location_city,
              onPressed: null,
            ),*/
          ],
          
        ),
        
      ),
      backgroundColor: Colors.white,
    );
    /*final ThemeData _theme = Theme.of(context);
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
              RaisedButton
              (
                
                child: const Text('Sign Out'),
                onPressed:(){

              }
              
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
    );*/
  }
}

class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  Function onPressed;

  InfoCard({
    @required this.text,
    @required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.white60,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.blueGrey,
          ),
          title: Text(
            text,
            style: GoogleFonts.sourceSansPro(fontSize: 20, color: Colors.blueGrey),
          ),
        ),
      ),
    );
  }
}