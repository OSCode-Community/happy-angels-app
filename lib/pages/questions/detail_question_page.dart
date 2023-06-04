import 'package:bloc_auth_app/constants/questions_details_constants.dart';
import 'package:bloc_auth_app/pages/questions/gtk_question_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailQuestionPage extends StatefulWidget {
  static const String routeName = '/detailquestionpage';

  const DetailQuestionPage({super.key});

  @override
  State<DetailQuestionPage> createState() => _DetailQuestionPageState();
}

class _DetailQuestionPageState extends State<DetailQuestionPage> {
  TextEditingController dateInput = TextEditingController();
  TextEditingController schoolNameController =
      TextEditingController(text: "Enter school name");

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
                    begin: Alignment(-0.2, 0.7),
                    end: Alignment(0.95, 1.3),
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
                        padding: EdgeInsets.fromLTRB(20, 140, 0, 50),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(children: [
                            Text(
                              "Hi \nParents!",
                              style: TextStyle(
                                  fontSize: 28,
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
                        padding: const EdgeInsets.only(top: 38.0),
                        child: Image.asset(
                          'assets/images/parentquestion.png',
                          width: 180,
                          height: 140,
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
                              "Gender",
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
                              itemCount: gender.length,
                              itemBuilder: (context, int index) {
                                return ListTile(
                                    title: Text(
                                      gender[index][1],
                                      style: TextStyle(color: Colors.purple),
                                    ),
                                    leading: Checkbox(
                                        value: gender[index][0],
                                        onChanged: ((value) {
                                          setState(() {
                                            if (value == false) {
                                              gender[index][0] = value;
                                            } else
                                              gender[index][0] = value;
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
                  SizedBox(
                    height: 55,
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
                              "Child's DOB",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: TextField(
                              controller: dateInput,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.purple,
                                ),
                                //icon of text field
                                labelText: "Enter Date", //label text of field
                              ),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2100));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  print(
                                      formattedDate); //formatted date output using intl package =>  2021-03-16
                                  setState(() {
                                    dateInput.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {}
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
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
                              "Child's School Name",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: TextFormField(
                              controller: schoolNameController,
                            ),
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
                              "What are your Child's main interests or hobbies ?",
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
                              itemCount: hobbies.length,
                              itemBuilder: (context, int index) {
                                return ListTile(
                                    title: Text(
                                      hobbies[index][1],
                                      style: TextStyle(color: Colors.purple),
                                    ),
                                    leading: Checkbox(
                                        value: hobbies[index][0],
                                        onChanged: ((value) {
                                          setState(() {
                                            if (value == false) {
                                              hobbies[index][0] = value;
                                            } else
                                              hobbies[index][0] = value;
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
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GTKQuestionPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple, // Background color
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            '           Next ->          ',
                          ),
                        )),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
