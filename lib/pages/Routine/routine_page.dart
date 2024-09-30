import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/widgets/tab_bar.dart';

class RoutinePage extends StatelessWidget {
  const RoutinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
       onWillPop: () async {
        Get.offAllNamed('/HomePage'); 
        return false; // Prevent default back navigation
      },
      child: SafeArea(
        child: DefaultTabController(
          length: 8,
          initialIndex: 1,
          child: Column(
            children: [
              Expanded(
                
                child: NavTabBar()),
            ],
          ),
        ),
      ),
    );
  }
}
