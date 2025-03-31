import 'package:flutter/material.dart';
import 'package:mobileapp/components/messageHelper.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final phoneNumber = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool eye = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have account!"),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Sign In",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(color: Colors.red),
            ),
            Positioned(
              top: 50,
              right: 50,
              left: 50,
              child: Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 90,
              child: SingleChildScrollView(
                child: Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Text(
                              "Full name",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              controller: fullname,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "fullname ຫ້າມວ່າງ!";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  errorBorder: OutlineInputBorder(),
                                  focusedErrorBorder: OutlineInputBorder(),
                                  hintText: "firstname and lastname",
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Text(
                              "phoneNumber",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              controller: phoneNumber,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "phoneNumber ຫ້າມວ່າງ!";
                                } else if (value.length < 10) {
                                  return "ເບີໂທຕ້ອງມີ 10 ຕົວເລກ!";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                errorBorder: OutlineInputBorder(),
                                focusedErrorBorder: OutlineInputBorder(),
                                hintText: "20xxxxxx",
                                prefixIcon: Icon(Icons.phone),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "email ຫ້າມວ່າງ!";
                                } else if (!value.contains("@gmail.com")) {
                                  return "@gmail.com ຫ້າມວ່າງ!";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                errorBorder: OutlineInputBorder(),
                                focusedErrorBorder: OutlineInputBorder(),
                                hintText: "example@gmail.com",
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Text(
                              "Password",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              obscureText: eye,
                              controller: password,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "password ຫ້າມວ່າງ!";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                errorBorder: OutlineInputBorder(),
                                focusedErrorBorder: OutlineInputBorder(),
                                hintText: "********",
                                prefixIcon: Icon(Icons.security),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      eye = !eye;
                                    });
                                  },
                                  icon: Icon(Icons.remove_red_eye),
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                              child: InkWell(
                                onTap: (){
                                  if(formKey.currentState!.validate()){
                                    MessageHelper.showMessageBar(true, "Register Success");
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: size.width / 1.2,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
