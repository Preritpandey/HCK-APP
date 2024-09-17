import 'package:flutter/material.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_normal.dart';
import 'package:hck_app/models/internship_model.dart';

class InternShipContainer extends StatelessWidget {
  final Job job;

  const InternShipContainer({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          color:
              Theme.of(context).brightness == Brightness.dark ? black1 : grey,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextNormal(
              text: job.jobTitle,
              size: fontSize12,
              fontWeight: FontWeight.w600),
          TextNormal(
            text: job.jobCategory.name,
            size: fontSize10,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          TextNormal(
              text: 'Deadline: ${job.applicationDeadline}',
              size: fontSize10,
              fontWeight: FontWeight.w500),
        ],
      ),
    );
  }
}






// ///////-------------------------OLD CODE----------------------------------

// import 'package:hck_app/resources/constant.dart';

// import '../../../../resources/text_normal.dart';
// import 'package:flutter/material.dart';

// class InternShipContainer extends StatelessWidget {
//   const InternShipContainer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       width: double.maxFinite,
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//       decoration: BoxDecoration(
//           color:
//               Theme.of(context).brightness == Brightness.dark ? black1 : grey,
//           borderRadius: BorderRadius.circular(8)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextNormal(
//               text: "Internship oppourtunities at IT and NOC..",
//               size: fontSize12,
//               fontWeight: FontWeight.w600),
//           TextNormal(
//             text: "Student Service-Herald College",
//             size: fontSize10,
//             fontWeight: FontWeight.w500,
//             color: Colors.grey,
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.04,
//           ),
//           TextNormal(
//               text: "Dedline:1st Dec,2022",
//               size: fontSize10,
//               fontWeight: FontWeight.w500),
//         ],
//       ),
//     );
//   }
// }
