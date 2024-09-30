import 'package:flutter/material.dart';
import 'package:hck_app/pages/Notice/utils/internship_container.dart';
import 'package:hck_app/pages/Notice/utils/internship_services.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_normal.dart';
import 'package:hck_app/models/internship_model.dart';

class InternshipBody extends StatefulWidget {
  const InternshipBody({super.key});

  @override
  State<InternshipBody> createState() => _InternshipBodyState();
}

class _InternshipBodyState extends State<InternshipBody> {
  late Future<List<Job>> _futureJobs;

  @override
  void initState() {
    super.initState();
    _futureJobs = JobService().fetchJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          const TextNormal(
              text: "Available Now",
              fontWeight: FontWeight.w600,
              size: fontSize16),
          Expanded(
            child: FutureBuilder<List<Job>>(
              future: _futureJobs,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No internships available'));
                } else {
                  final jobs = snapshot.data!;
                  return ListView.builder(
                    itemCount: jobs.length,
                    itemBuilder: (context, index) {
                      final job = jobs[index];
                      return InternShipContainer(job: job);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
