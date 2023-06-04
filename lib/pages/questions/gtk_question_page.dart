import 'package:bloc_auth_app/constants/questions_details_constants.dart';
import 'package:bloc_auth_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class GTKQuestionPage extends StatefulWidget {
  static const String routeName = '/gtkquestionpage';

  const GTKQuestionPage({super.key});

  @override
  State<GTKQuestionPage> createState() => _GTKQuestionPageState();
}

class _GTKQuestionPageState extends State<GTKQuestionPage> {
  TextEditingController dateInput = TextEditingController();
  TextEditingController schoolNameController =
      TextEditingController(text: "Enter school name");

  TextEditingController foodlNameController =
      TextEditingController(text: "Enter foods name");

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-0.2, 0.6),
                    end: Alignment(0.95, 1.5),
                    colors: [Color(0xFFA31ACB), Color(0x80F5EA5A)],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 110, 0, 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(children: [
                            Text(
                              "Hey! \nbuddy!",
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 58.0),
                        child: Image.asset(
                          'assets/images/childquestion.png',
                          width: 170,
                          height: 180,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 270),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 35.0, bottom: 35, left: 50, right: 50),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, bottom: 15, left: 40, right: 40),
                        child: Text(
                          "Please Fill The Details",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 35, right: 35),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 6.0,
                              color: Colors.purple,
                              offset: Offset(
                                0,
                                5,
                              ),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "What activities do you enjoy the most ?",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple),
                            ),
                          ),
                          SizedBox(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: activities.length,
                              itemBuilder: (context, int index) {
                                return ListTile(
                                  title: Text(
                                    activities[index][1],
                                    style: TextStyle(color: Colors.purple),
                                  ),
                                  leading: Checkbox(
                                      value: activities[index][0],
                                      onChanged: ((value) {
                                        setState(() {
                                          if (value == false) {
                                            activities[index][0] = value;
                                          } else
                                            activities[index][0] = value;
                                        });
                                      }),
                                      fillColor:
                                          MaterialStateProperty.resolveWith(
                                              (Set states) {
                                        if (states
                                            .contains(MaterialState.disabled)) {
                                          return Colors.purple.withOpacity(.32);
                                        }
                                        return Colors.purple;
                                      })),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 6.0,
                              color: Colors.purple,
                              offset: Offset(
                                0,
                                5,
                              ),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Is there anything specific that you would like to learn or explore ?",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: explore.length,
                              itemBuilder: (context, int index) {
                                return ListTile(
                                    title: Text(
                                      explore[index][1],
                                      style: TextStyle(color: Colors.purple),
                                    ),
                                    leading: Checkbox(
                                        value: explore[index][0],
                                        onChanged: ((value) {
                                          setState(() {
                                            if (value == false) {
                                              explore[index][0] = value;
                                            } else
                                              explore[index][0] = value;
                                          });
                                        }),
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                                (Set states) {
                                          if (states.contains(
                                              MaterialState.disabled)) {
                                            return Colors.purple
                                                .withOpacity(.32);
                                          }
                                          return Colors.purple;
                                        })));
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 6.0,
                              color: Colors.purple,
                              offset: Offset(
                                0,
                                5,
                              ),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "What are your favourite subjects in school ?",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: subjects.length,
                              itemBuilder: (context, int index) {
                                return ListTile(
                                    title: Text(
                                      subjects[index][1],
                                      style: TextStyle(color: Colors.purple),
                                    ),
                                    leading: Checkbox(
                                        value: subjects[index][0],
                                        onChanged: ((value) {
                                          setState(() {
                                            if (value == false) {
                                              subjects[index][0] = value;
                                            } else
                                              subjects[index][0] = value;
                                          });
                                        }),
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                                (Set states) {
                                          if (states.contains(
                                              MaterialState.disabled)) {
                                            return Colors.purple
                                                .withOpacity(.32);
                                          }
                                          return Colors.purple;
                                        })));
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 6.0,
                              color: Colors.purple,
                              offset: Offset(
                                0,
                                5,
                              ),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "What are your favourite foods ?",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: TextFormField(
                              controller: foodlNameController,
                              style: TextStyle(
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple, // Background color
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Text(
                                '  <- Previous  ',
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple, // Background color
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Text(
                                '  Next ->  ',
                              ),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
