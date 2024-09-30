import 'package:flutter/material.dart';
import 'package:hck_app/data/course_data.dart'; // Import your course data file
import 'package:hck_app/widgets/course_detail.dart';
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

  // Initial course data to display
  List<Map<String, String>> currentCourses = bcs.coursesPerYear[0];

  // Method to update courses based on selected year
  void updateCourses(String year) {
    setState(() {
      if (year == items[0]) {
        currentCourses = bcs.coursesPerYear[0];
      } else if (year == items[1]) {
        currentCourses = bcs.coursesPerYear[1];
      } else if (year == items[2]) {
        currentCourses = bcs.coursesPerYear[2];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 3),
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
                width: MediaQuery.of(context).size.width * 0.7,
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
                      underline: const Text(''),
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
                          updateCourses(dropdownvalue);
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
              // Displaying the current courses based on dropdown value
              Expanded(
                child: ListView.builder(
                  itemCount: currentCourses.length,
                  itemBuilder: (context, index) {
                    final course = currentCourses[index];
                    return CourseInfo(
                      title: course.keys.first,
                      subTitle: course.values.first,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
