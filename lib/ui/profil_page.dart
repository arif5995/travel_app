import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF17ead9), Colors.lightBlueAccent],
            ),
          ),
        ),
        title: Text(
          "Edit Profile",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Banana',
            fontSize: 25.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text("Apply", style: TextStyle(fontSize: 12, color: Colors.white),),
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(150),
                bottomRight: Radius.circular(150)
              ),
              gradient:  LinearGradient(
                colors: [Color(0xFF17ead9), Colors.lightBlueAccent],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 90,
                    ),
                    ClipOval(
                      child: Image.asset(
                        'assets/images/icon_profil.jpg',
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Abdallah Mostafa", style: TextStyle(fontSize: 25),),
                        SizedBox(width: 5,),
                        Text("Edit", style: TextStyle(fontSize: 12, color: Colors.grey),),
                      ],
                    ),
                    Text("Mansoura, Egypt", style: TextStyle(fontSize: 15, color: Colors.grey),),
                    SizedBox(
                      height: 40,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                        child: Text("Private Details", style: TextStyle(fontSize: 15, color: Colors.black),)),
                    SizedBox(height: 15,),
                    _inputEditProfile(title: "Email"),
                    SizedBox(height: 10,),
                    _inputEditProfile(title: "Password"),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                            child: _inputEditProfile(title: "Grander")),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 2,
                            child: _inputEditProfile(title: "Age")),
                      ],
                    ),
                    SizedBox(height: 10,),
                    _inputEditProfile(title: "Phone Number"),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Container _inputEditProfile({String title}){
  return Container(
    height: 50.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      gradient:  LinearGradient(
        colors: [Color(0xFF17ead9), Colors.lightBlueAccent],
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(title,
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  letterSpacing: 0.92,
                  color: const Color(0x99000000))),
          new Expanded(
            child: new TextField(
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                letterSpacing: 0.92,
                color: const Color(0xFF000000),
              ),
              decoration: new InputDecoration(
                  border: InputBorder.none),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    ),
  );
}
