import 'package:flutter/material.dart';
import 'package:hck_app/models/lost_and_found_model.dart';
import 'package:hck_app/widgets/footer.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_heading.dart';
import 'package:hck_app/resources/text_normal.dart';

class RequestDetails extends StatelessWidget {
  const RequestDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final LostAndFoundDetails data =
        ModalRoute.of(context)!.settings.arguments as LostAndFoundDetails;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            _ItemTitle(data: data),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailsRow(title: 'Name:', text: data.name),
                  DetailsRow(title: 'Phone:', text: data.phone),
                  DetailsRow(title: 'Item Category:', text: data.itemCategory),
                  DetailsRow(title: 'Lost Date:', text: data.lostDate),
                  DetailsRow(title: 'Block:', text: data.block),
                  DetailsRow(
                    title: 'Item Description:',
                    text: data.itemDescription,
                    isNewLine: true,
                  ),
                  DetailsRow(
                    title: 'Additional Location Description:',
                    text: data.additionalLocationDescription,
                    isNewLine: true,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 22),
              decoration: BoxDecoration(
                color: data.status == 'Open' ? heraldGreen : Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: TextHeading(
                  text: data.date,
                  size: fontSize14,
                  color: white,
                ),
              ),
            )
          ],
        ),
      ),
      persistentFooterButtons: const [Footer()],
    );
  }
}

class DetailsRow extends StatelessWidget {
  final String title;
  final String text;
  final bool isNewLine;

  const DetailsRow({
    super.key,
    required this.title,
    required this.text,
    this.isNewLine = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.01),
        child: isNewLine
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextNormal(
                    text: title,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  TextNormal(
                    text: text,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.justify,
                  ),
                ],
              )
            : Row(children: [
                TextNormal(
                  text: title,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                TextNormal(text: text, fontWeight: FontWeight.w400),
              ]));
  }
}

class _ItemTitle extends StatelessWidget {
  const _ItemTitle({
    required this.data,
  });

  final LostAndFoundDetails data;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextHeading(
                    text: data.itemTitle,
                    size: fontSize18,
                    maxLines: 3,
                  )),
              Row(children: [
                const TextHeading(text: 'Status: ', size: fontSize16),
                TextHeading(
                    text: data.status,
                    size: fontSize16,
                    color: data.status == 'Open' ? Colors.green : Colors.red)
              ])
            ]),
            const Divider(color: black3, thickness: 1),
          ],
        ));
  }
}
