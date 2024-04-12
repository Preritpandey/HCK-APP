import 'package:flutter/material.dart';
import 'package:hck_app/resources/constant.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabString;
  const CustomTabBar({Key? key, required this.tabString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabAlignment: TabAlignment.start,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      labelPadding: const EdgeInsets.symmetric(horizontal: 5),
      indicatorWeight: 0,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: Colors.white,
      indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: heraldGreen),
      isScrollable: true,
      tabs: [
        for (int i = 0; i < tabString.length; i++)
          _CustomTabBuilder(text: tabString[i])
      ],
    );
  }
}

class _CustomTabBuilder extends StatelessWidget {
  final String text;
  const _CustomTabBuilder({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      child: Tab(
          height: MediaQuery.of(context).size.height * 0.04,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: fontSize14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
