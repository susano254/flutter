import 'package:flutter/material.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/my_inkwell.dart';

class RegisterPage extends StatefulWidget {

  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var _isObsecured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/background.png"),
                  )
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 80),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.person, color: Colors.white, size: 100,),
                        Text(
                          "Sign-In",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimensions.vertical(24),
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.vertical(40)),
                  Container(
                    height: Dimensions.vertical(50),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    padding: EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: TextFormField(
                      style: TextStyle( color: Colors.white, fontSize: 14 ),
                      decoration: InputDecoration(
                        icon: Icon(Icons.mail, size: 20,),
                        iconColor: Colors.white,
                        labelText: "Email Address",
                        labelStyle: TextStyle( color: Colors.white, fontSize: 14 ),
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.vertical(10)),
                  Container(
                    height: Dimensions.vertical(50),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    padding: EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: TextFormField(
                      style: TextStyle( color: Colors.white, fontSize: 14 ),
                      decoration: InputDecoration(
                        icon: Icon(Icons.mail, size: 20,),
                        iconColor: Colors.white,
                        labelText: "Email Address",
                        labelStyle: TextStyle( color: Colors.white, fontSize: 14 ),
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.vertical(10)),
                  Container(
                    height: Dimensions.vertical(50),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    padding: EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: TextFormField(
                      style: TextStyle( color: Colors.white, fontSize: 14 ),
                      decoration: InputDecoration(
                        icon: Icon(Icons.mail, size: 20,),
                        iconColor: Colors.white,
                        labelText: "Email Address",
                        labelStyle: TextStyle( color: Colors.white, fontSize: 14 ),
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.vertical(10)),
                  Container(
                    height: Dimensions.vertical(50),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    padding: EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: TextFormField(
                      obscureText: _isObsecured,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          iconColor: Colors.white,
                          labelText: "Password",
                          labelStyle: TextStyle( color: Colors.white, fontSize: 14 ),
                          enabledBorder: InputBorder.none,
                          suffixIcon: Material(
                            color: Colors.transparent,
                            child: IconButton(
                              splashRadius: 20,
                              icon: _isObsecured ? Icon(Icons.visibility, color: Colors.white,) : Icon(Icons.visibility_off, color: Colors.white),
                              onPressed: (){
                                setState(() {
                                  _isObsecured = !_isObsecured;
                                });
                              },
                            ),
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.vertical(50)),
                  MyInkWell(
                    onTap: (){},
                    splashColor: Colors.blueAccent,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: Dimensions.horizontal(280),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.lightBlueAccent.withOpacity(0.5)
                      ),
                      child: Center(child: BigText(text: "LOGIN", color: Colors.white, size: 20,)),
                    ),
                  ),
                  SizedBox(height: Dimensions.vertical(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyInkWell(
                          onTap: (){},
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: BigText(text: "Forgot Password?", size: 16, color: Colors.white,),
                          )
                      ),
                      SizedBox(width: Dimensions.horizontal(40),),
                      MyInkWell(
                          onTap: (){
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: BigText(text: "Register", size: 16, color: Colors.white,),
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.vertical(20)),
                  Expanded(child: Container()),
                  BigText(text: "or sign in with:"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyInkWell(
                        onTap: (){},
                        child: Container(
                          height: Dimensions.vertical(48),
                          width: Dimensions.horizontal(48),
                          margin: EdgeInsets.all(Dimensions.vertical(10)),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/google.png")
                              )

                          ),
                        ),
                      ),
                      MyInkWell(
                        onTap: (){},
                        child: Container(
                          height: Dimensions.vertical(48),
                          width: Dimensions.horizontal(48),
                          margin: EdgeInsets.all(Dimensions.vertical(10)),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/facebook.png")
                              )

                          ),
                        ),
                      ),
                      MyInkWell(
                        onTap: (){},
                        child: Container(
                          height: Dimensions.vertical(48),
                          width: Dimensions.horizontal(48),
                          margin: EdgeInsets.all(Dimensions.vertical(10)),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/twitter.png")
                              )

                          ),
                        ),
                      ),

                    ],
                  )
                ],

              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, left: 5),
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 24,)
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
