import 'package:flutter/material.dart';
import 'package:hck_app/pages/widgets/course_detail.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_body.dart';
import 'package:hck_app/resources/text_heading.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  // Initial Selected Value
  String dropdownvalue = 'Level 4 / Year 1';

  // List of items in our dropdown menu
  var items = [
    'Level 4 / Year 1',
    'Level 3 / Year 2',
    'Level 2 / Year 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 8.0, bottom: 8, left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
            Padding(
              padding:
                  EdgeInsets.only(left: MediaQuery.of(context).size.width / 3),
              child: const TextHeading(
                text: 'Courses in Herald',
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            const TextHeading(text: "Bachelor's in Information \nTechnology"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            const Text(
              'Bsc (Hons) Computer Science',
              style: TextStyle(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Container(
              height: 30,
              decoration: BoxDecoration(border: Border.all(color: grey)),
              width: MediaQuery.of(context).size.width * 0.55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Center(
                      child: TextBody(
                    text: 'Course Level',
                    color: heraldGreen,
                    size: 14,
                  )),
                  const Center(
                    child: Text(
                      '|',
                      style: TextStyle(color: grey, fontSize: 20),
                    ),
                  ),
                  DropdownButton(
                    // Initial Value
                    focusColor: Colors.transparent,
                    underline: Text(''),
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.arrow_drop_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            const CourseInfo(
              title: 'Module Name',
              subTitle: 'Module Code',
              backgroundColor: heraldGreen,
            ),
            const CourseInfo(
              title: 'Fundamentals of Computing',
              subTitle: '4C102',
            ),
            const CourseInfo(
              title: 'Introductary Programming',
              subTitle: '4C12O',
            ),
            const CourseInfo(
              title: 'Web Technologies',
              subTitle: '4CS02',
            ),
          ],
        ),
      ),
    );
  }
}
