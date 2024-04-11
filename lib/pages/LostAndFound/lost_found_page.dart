import 'package:flutter/material.dart';
import 'package:hck_app/pages/LostAndFound/history_page.dart';
import 'package:hck_app/pages/LostAndFound/pending_page.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_heading.dart';

class LostAndFoundPage extends StatefulWidget {
  const LostAndFoundPage({super.key});

  @override
  State<LostAndFoundPage> createState() => _LostAndFoundPageState();
}

class _LostAndFoundPageState extends State<LostAndFoundPage> {
  bool requestButtonState = false;
  bool pendingButtonState = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextHeading(
                    text: 'Lost and Found',
                    color: textColor,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/editItems.png'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      elevation: 0,
                      backgroundColor:
                          requestButtonState ? heraldGreen : transparent,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: requestButtonState ? transparent : grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        requestButtonState = true;
                        pendingButtonState = false;
                      });
                    },
                    child: const Text('Request History'),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor:
                          pendingButtonState ? heraldGreen : transparent,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: pendingButtonState ? transparent : grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        requestButtonState = false;
                        pendingButtonState = true;
                      });
                    },
                    child: const Text('Pending Items'),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              pendingButtonState ? const PendingPage() : const HistoryPage(),
            ],
          ),
        ),
      ),
    );
  }
}
