import 'package:flutter/material.dart';
import '../components/rounded_button.dart';

class IssueBook extends StatefulWidget {
  @override
  _IssueBookState createState() => _IssueBookState();
}

class _IssueBookState extends State<IssueBook> {
  int bookid = 0;

  String dropdownValue = 'Educational';
  final myController = TextEditingController();

  Widget createDropDown() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      onChanged: (newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>[
        'Educational',
        'Data Structures',
        'Algorithms',
        'Signals and Systems',
        'Operating Systems',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/register.jpg'),
              fit: BoxFit.cover),
        ),
        child: ListView(
          children: [
            //1st container

            Container(
              padding: EdgeInsets.only(
                left: 75,
                top: 5,
              ),
            ),

            SizedBox(
              height: 90,
            ),

            //2nd contianer

            Container(
              padding: EdgeInsets.only(left: 100, top: 20),
              child: Text(
                "Issue Book",
                style: TextStyle(
                  color: Colors.lightBlue.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            /* Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: myController,
              ),
            
            ), */
            Container(
              width: 30,
              height: 70,
              padding: EdgeInsets.only(
                left: 100,
              ),
              child: createDropDown(),
            ),

            Container(
              height: 60,
              width: 50,
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                top: 20,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          content: Text(
                            'Selected Book: $dropdownValue',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    );
                  },
                  child: Text("Issue Book")),
            ),
          ],
        ),
      ),
    );
  }
}
