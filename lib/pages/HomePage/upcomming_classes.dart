import 'package:flutter/material.dart';
import 'package:hck_app/models/routine_model.dart'; // Import your class model
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_heading.dart';

class UpcomingClasses extends StatelessWidget {
  final List<OngoingClassGroup>
      classes; // Accept the list of classes dynamically

  const UpcomingClasses({super.key, required this.classes});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4.5,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(right: 25),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: classes.length,
          itemBuilder: (context, index) {
            OngoingClassGroup ongoingClass =
                classes[index]; // Get each class dynamically

            return SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 1.6,
              child: Card(
                shape: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                elevation: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 10, bottom: 10),
                      child: TextHeading(
                        text: ongoingClass.moduleName,
                        color: darkBluishGreen,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.access_time_outlined,
                            color: iconColorBlack,
                            size: 20,
                          ),
                          Text(
                              '${ongoingClass.startTime} - ${ongoingClass.endTime}'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: heraldGreen,
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                        ),
                        onPressed: () {
                          // Add reminder functionality here
                        },
                        child: const Text(
                          "Set Reminder",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}








// ----------------------old---------------////////////////////////////////--------------------------------------------------



// import 'package:flutter/material.dart';
// import 'package:hck_app/resources/constant.dart';
// import 'package:hck_app/resources/text_heading.dart';

// class UpcomingClasses extends StatelessWidget {
//   const UpcomingClasses({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height / 4.5,
//       width: MediaQuery.of(context).size.width,
//       child: Padding(
//         padding: const EdgeInsets.only(right: 25),
//         child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: 3,
//             itemBuilder: (context, index) {
//               return SizedBox(
//                 height: MediaQuery.of(context).size.height / 5,
//                 width: MediaQuery.of(context).size.width / 1.6,
//                 child: Card(
//                   shape: const OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                       borderSide: BorderSide(
//                         color: Colors.grey,
//                       )),
//                   elevation: 0,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
//                         child: TextHeading(
//                           text: "Object Oriented\nProgramming",
//                           color: darkBluishGreen,
//                         ),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.only(left: 30.0),
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.access_time_outlined,
//                               color: iconColorBlack,
//                               size: 20,
//                             ),
//                             Text('2:30 PM - 4:00 PM'),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 30.0, top: 10),
//                         child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: heraldGreen,
//                                 shape: BeveledRectangleBorder(
//                                     borderRadius: BorderRadius.circular(3))),
//                             onPressed: () {},
//                             child: const Text(
//                               "Set Reminder",
//                               style: TextStyle(color: Colors.white),
//                             )),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             }),
//       ),
//     );
//   }
// }

