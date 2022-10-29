import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _email = TextEditingController();
  var _pass = TextEditingController();
  var phone = TextEditingController();
  var firstname = TextEditingController();
  var lastname = TextEditingController();
  var _formkey = GlobalKey<FormState>();

  login(){
    if(_formkey.currentState!.validate()){
      print("email: $_email");
      print("pass: $_pass");
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        // width: double.infinity,
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Center(
                  child: Text(
                "sign in",
                style: TextStyle(color: Colors.black, fontSize: 40),
              )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        label: Text("First name"),
                        prefixIcon: Icon(Icons.account_circle_sharp),
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: lastname,
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        label: Text("Last name"),
                        prefixIcon: Icon(Icons.account_circle_sharp),
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                onChanged: (value){
                  print(value);
                },
                validator: (value) {
                  if (value!.isEmpty ) {
                    return "please enter your email";
                  }else if(!value!.contains("@")){
                    return "it doesn't contains @";
                  }
                },
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  label: Text("Email"),
                  prefixIcon: Icon(Icons.email),
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty || value.length<4){
                    return "please enter more than 4 ";
                  }
                },
                controller: _pass,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  label: Text("Password"),
                  prefixIcon: Icon(Icons.lock),
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  label: Text("Phone"),
                  prefixIcon: Icon(Icons.phone),
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_email.text);
                  _formkey.currentState!.validate();
                },
                child: Text(
                  "sign up",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.purpleAccent, fixedSize: Size(300, 20)),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
