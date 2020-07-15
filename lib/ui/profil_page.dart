import 'package:flutter/material.dart';
import 'package:travelapp/core/bloc/user_bloc.dart';
import 'package:travelapp/core/model/user/UserResponse.dart';
import 'package:travelapp/ui/widget/appbar.dart';
import 'package:travelapp/ui/widget/curve_painter_half_circle.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  void initState() {
    blocUser.fetchUser();
    super.initState();
  }

  @override
  void dispose() {
    blocUser.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTop(title: "Explore", textRight: "Apply"),
      body: SingleChildScrollView(
        child: CustomPaint(
          painter: CurvePainter(),
          child: Stack(
            children: <Widget>[
//          Container(
//            color: Colors.white,
//            height: MediaQuery.of(context).size.height,
//          ),
//          Container(
//            height: MediaQuery.of(context).size.height * 0.25,
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.only(
//                bottomLeft: Radius.circular(150),
//                bottomRight: Radius.circular(150)
//              ),
//              gradient:  LinearGradient(
//                colors: [Color(0xFF17ead9), Colors.lightBlueAccent],
//              ),
//            ),
//          ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: StreamBuilder<UserResponse>(
                    stream: blocUser.user,
                    builder: (context, snapshot) {
                      if (snapshot.hasData){
                        var user = snapshot.data;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 120,
                            ),
                            ClipOval(
                              child: Image.network(
                                user.data.avatar,
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
                                Text("${user.data.firstName} ${user.data.lastName}", style: TextStyle(fontSize: 25),),
                                SizedBox(width: 5,),
                                Text("Edit", style: TextStyle(fontSize: 12, color: Colors.grey),),
                              ],
                            ),
                            Center(child: Text(user.ad.text, style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center,)),
                            SizedBox(
                              height: 40,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text("Private Details", style: TextStyle(fontSize: 15, color: Colors.black),)),
                            SizedBox(height: 15,),
                            _inputEditProfile(title: user.data.email, boolPass: false),
                            SizedBox(height: 10,),
                            _inputEditProfile(title: "Password", boolPass: true),
                            SizedBox(height: 10,),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    flex: 2,
                                    child: _inputEditProfile(title: "Grander", boolPass: false)),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    flex: 2,
                                    child: _inputEditProfile(title: "Age", boolPass: false)),
                              ],
                            ),
                            SizedBox(height: 10,),
                            _inputEditProfile(title: "Phone Number", boolPass: false),
                          ],
                        );
                      } else if (snapshot.hasError){
                        return Text("Data tidak ada");
                      } return Center(child: CircularProgressIndicator(),);
                    }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Container _inputEditProfile({String title, bool boolPass}){
  return Container(
    height: 50.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.blue[50]
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
                  color: Colors.grey)),
          new Expanded(
            child: new TextField(
              obscureText: boolPass,
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Colors.blue,
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
