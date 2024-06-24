import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:userdetails/app/modules/home/models/user_model.dart';
import 'package:userdetails/app/modules/home/provider/home_provider.dart';

class HomeController extends GetxController {
  var isloading = false.obs;
  var list_users = <Usermodel>[].obs;
  var expandedAddressItems = <bool>[].obs;
  var expandedCompanyItems = <bool>[].obs;
  RxInt currentPage = 0.obs;
  PageController pageController = PageController();
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentPage.value);
    userdata();
  }

  userdata() async {
    isloading.value = false;
    var response = await homeprovider().GetData();
    final parsed = jsonDecode(response["message"]).cast<Map<String, dynamic>>();
    list_users.value =
        parsed.map<Usermodel>((json) => Usermodel.fromJson(json)).toList();

    expandedAddressItems.value =
        List<bool>.generate(list_users.length, (_) => false);
    expandedCompanyItems.value =
        List<bool>.generate(list_users.length, (_) => false);
    isloading.value = true;
  }

  void toggleExpandedAddress(int index) {
    if (index >= 0 && index < list_users.length) {
      expandedAddressItems[index] = !expandedAddressItems[index];
      update(); // Ensure the UI updates when state changes
    }
  }

  void toggleExpandedCompany(int index) {
    if (index >= 0 && index < list_users.length) {
      expandedCompanyItems[index] = !expandedCompanyItems[index];
      update(); // Ensure the UI updates when state changes
    }
  }

  Future<void> launchPhoneCall(String phoneNumber, BuildContext context) async {
    try {
      final formattedNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
      final url = Uri(scheme: 'tel', path: formattedNumber);
      await launchUrl(url);
    } on Exception catch (e) {
      print('Error launching call: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Failed to initiate call. Please check the phone number.'),
        ),
      );
    }
  }

  Future<void> launchEmail(String email, BuildContext context) async {
    try {
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: email,
      );
      await launchUrl(emailUri);
    } on Exception catch (e) {
      print('Error launching email: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Failed to initiate email. Please check the email address.'),
        ),
      );
    }
  }

  Future<void> launchWebsite(String url, BuildContext context) async {
    try {
      final Uri websiteUri = Uri.https('', url);
      await launchUrl(websiteUri);
    } on Exception catch (e) {
      print('Error launching website: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to open website. Please try again.'),
        ),
      );
    }
  }

  Future<void> launchGoogleMap(
      double latitude, double longitude, BuildContext context) async {
    try {
      final url =
          'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude'; // Added zoom level 15
      final uri = Uri.parse(url);

      await launchUrl(uri);
    } on Exception catch (e) {
      print('Error launching maps: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to initiate maps.'),
        ),
      );
    }
  }
}
