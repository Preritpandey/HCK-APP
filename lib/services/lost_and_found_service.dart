import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/models/lost_and_found_model.dart';

import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_normal.dart';
import 'package:hck_app/widgets/show_message.dart';
import 'package:hck_app/widgets/show_snack_bar.dart';
// import '../services/api_handler.dart';

class LostAndFoundController extends GetxController {
  final RxList<LostAndFoundDetails> _requestHistory =
      <LostAndFoundDetails>[].obs;

  @override
  void onInit() {
    getRequestHistory();
    super.onInit();
  }

  List<LostAndFoundDetails> get requestHistory => _requestHistory;

  RxString selectedCategory = ''.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<String> selectedBlock = ''.obs;
  RxString selectedFilterCategory = 'All'.obs;

  RxBool isLoading = false.obs;

  // final ApiHandler _handler = ApiHandler();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController itemNameController = TextEditingController();

  final TextEditingController itemDescriptionController =
      TextEditingController();
  final TextEditingController additionalDescriptionController =
      TextEditingController();

  List<String> categoryItems = [
    'Accessories',
    'Clothing',
    'Electronics',
    'Eyeglasses',
    'Water Bottles',
    'Miscellaneous'
  ];
  List<String> blockItems = ['HCK Block', 'WLV Block'];

  List<String> filterCategoryItems = [
    'All',
    'Accessories',
    'Clothing',
    'Electronics',
    'Eyeglasses',
    'Water Bottles',
    'Miscellaneous'
  ];

  void submitForm(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      reportLostAndFound(
        itemNameController.value.text,
        itemDescriptionController.text,
        selectedDate.value.toString(),
      );
    }
  }

  List<DropdownMenuItem<String>> get createCategoryList =>
      _createList(categoryItems);

  List<DropdownMenuItem<String>> get createBlockList => _createList(blockItems);

  List<DropdownMenuItem<String>> get createFilterCategory =>
      _createList(filterCategoryItems);

  void setCategoryItem(String item) => selectedCategory.value = item;
  void setBlockItem(String item) => selectedBlock.value = item;

  void setFilterCategoryItem(String item) =>
      selectedFilterCategory.value = item;

  /*
  {
  "firstName": "string",
  "lastName": "string",
  "phoneNumber": "string",
  "itemCategory": [
    "string"
  ],
  "description": "string",
  "lostDate": "string",
  "block": "string",
  "additionalDescription": "string",
  "isVictimRecievedData": "string"
}
  */

  void reportLostAndFound(
      String itemName, String description, String lostDate) async {
    // final Map<String, String> body = {
    //   "firstName": firstNameController.text,
    //   "lastName": lastNameController.text,
    //   "phoneNumber": phoneNumberController.text,
    //   "itemCategory": selectedCategory.value,
    //   "description": description,
    //   "lostDate": lostDate,
    //   "block": selectedBlock.value,
    //   "additionalDescription": additionalDescriptionController.text,
    //   "isVictimRecievedData": "false"
    // };
    // var jsonResponse =
    //     await _handler.apiHandler(Api.postLostAndFound, "POST", body: body);

    // Testing purpose only - Remove later
    var jsonResponse = await Future.delayed(const Duration(seconds: 1), () {
      // // For success response
      return 'success';
      // For error response
      //   return null;
    });

    isLoading.value = false;

    // ignore: unnecessary_null_comparison
    if (jsonResponse != null) {
      showSnackBar("Submission received. We will look for your item!");
      Timer(const Duration(milliseconds: 200), () {
        Get.back();
        clearForm();
      });
    } else {
      showMessage('⚠️ Something went wrong',
          'There was an error handling your request. Please try again later.',
          () {
        reportLostAndFound(itemName, description, lostDate);
        Get.back();
      }, () {
        Get.back();
      }, buttonText1: 'Try Again', buttonText2: 'Cancel');
    }
  }

  List<DropdownMenuItem<String>> _createList(List<String> items) {
    return items
        .map((item) => DropdownMenuItem<String>(
            alignment: Alignment.centerLeft,
            value: item,
            child: TextNormal(text: item, size: fontSize14)))
        .toList();
  }

  void clearForm() {
    Timer(const Duration(milliseconds: 200), () {
      firstNameController.clear();
      lastNameController.clear();
      phoneNumberController.clear();
      itemNameController.clear();
      itemDescriptionController.clear();
      additionalDescriptionController.clear();
    });
  }

  @override
  void dispose() {
    itemDescriptionController.dispose();
    additionalDescriptionController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    itemNameController.dispose();
    super.dispose();
  }

  getRequestHistory() {
    // TO:DO: Add API call to get request history

    // Dummy Data
    List<Map<String, dynamic>> requestHistory = [
      {
        'name': 'John Doe',
        'phone': '9834567890',
        'itemTitle': 'iPhone 17 Pro Max Ultra 5G 512GB Royal Blue',
        'itemCategory': 'Electronics',
        'lostDate': '02/11/2022',
        'block': 'HCK Block',
        'itemDescription':
            'I got it from Tim Cook :(( Please return it if you find it or i will be very sad',
        'additionalLocationDescription': 'I lost it in the library.',
        'status': 'Open',
        'date': 'Fri, 4th Nov 2022',
      },
      {
        'name': 'John Doe',
        'phone': '9834567890',
        'itemTitle': 'Black Hoodie',
        'itemCategory': 'Clothing',
        'lostDate': '03/11/2022',
        'block': 'WLV Block',
        'itemDescription': 'Black Hoodie with a red logo on the front.',
        'additionalLocationDescription': 'I lost it in the basketball court.',
        'status': 'Open',
        'date': 'Fri, 4th Nov 2022',
      },
      {
        'name': 'John Doe',
        'phone': '9834567890',
        'itemTitle': 'Macbook Pro 2021',
        'itemCategory': 'Electronics',
        'lostDate': '02/11/2022',
        'block': 'WLV Block',
        'itemDescription': 'Macbook Pro 2021 16 inch with 1TB SSD',
        'additionalLocationDescription': 'I lost it in the Lecture Hall 1.',
        'status': 'Open',
        'date': 'Fri, 4th Nov 2022',
      },
      {
        'name': 'John Doe',
        'phone': '9834567890',
        'itemTitle': 'Electronics',
        'itemCategory': 'Electronics',
        'lostDate': '22/07/2022',
        'block': 'WLV Block',
        'itemDescription':
            'Lorem Ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        'additionalLocationDescription':
            'Lorem Ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        'status': 'Open',
        'date': 'Sun, 31st July 2022',
      },
      {
        'name': 'John Doe',
        'phone': '9834567890',
        'itemTitle': 'Rayban Sunglasses',
        'itemCategory': 'Eyeglasses',
        'lostDate': '25/07/2022',
        'block': 'WLV Block',
        'itemDescription': 'Lorem ipsum\nLorem ipsum\n',
        'additionalLocationDescription': 'Lorem ipsum\nLorem ipsum\n',
        'status': 'Open',
        'date': 'Sun, 31st July 2022',
      },
      {
        'name': 'John Doe',
        'phone': '9834567890',
        'itemTitle': 'Blue Jeans',
        'itemCategory': 'Clothing',
        'lostDate': '14/07/2022',
        'block': 'HCK Block',
        'itemDescription': 'Lorem ipsum\nLorem ipsum\n',
        'additionalLocationDescription': 'N/A',
        'status': 'Closed',
        'date': 'Fri, 15th July 2022',
      },
      {
        'name': 'John Doe',
        'phone': '9834567890',
        'itemTitle': 'Transparent Water Bottle',
        'itemCategory': 'Water Bottles',
        'lostDate': '04/06/2022',
        'block': 'WLV Block',
        'itemDescription': 'Lorem ipsum\nLorem ipsum\n',
        'additionalLocationDescription': 'Lorem ipsum\nLorem ipsum\n',
        'status': 'Closed',
        'date': 'Mon, 6th July 2022',
      }
    ];
    _requestHistory.value = requestHistory
        .map((request) => LostAndFoundDetails.fromJson(request))
        .toList();
  }
}
