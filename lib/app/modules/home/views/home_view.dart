import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:userdetails/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: Obx(
            () => controller.isloading.value == false
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          itemCount: controller.list_users.length,
                          controller: controller.pageController,
                          itemBuilder: (context, index) {
                            final user = controller.list_users[index];

                            return SingleChildScrollView(
                              controller: controller
                                  .scrollController, // Attach the scroll controller here
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.arrow_back),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                      Spacer(),
                                      SmoothPageIndicator(
                                        controller: controller.pageController,
                                        count: controller.list_users.length,
                                        effect: const ScrollingDotsEffect(
                                          activeStrokeWidth: 2.6,
                                          activeDotScale: 1.3,
                                          maxVisibleDots: 5,
                                          radius: 6,
                                          spacing: 8,
                                          dotHeight: 10,
                                          dotWidth: 10,
                                        ),
                                      ),
                                      Spacer(
                                        flex: 1,
                                      ),
                                    ],
                                  ),
                                  Card(
                                    elevation: 15.0,
                                    margin: const EdgeInsets.all(15.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                user.username!,
                                                style: const TextStyle(
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                              width: 140,
                                              height: 140.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(75.0),
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 0.8,
                                                ),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(75.0),
                                                child: Image.asset(
                                                  'assets/images/profile.png',
                                                  width: 140.0,
                                                  height: 140.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.call,
                                                  size: 40,
                                                ),
                                                color: Colors.green,
                                                onPressed: () {
                                                  controller.launchPhoneCall(
                                                      user.phone!, context);
                                                },
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    controller.launchEmail(
                                                        user.email!, context);
                                                  },
                                                  icon: const Icon(
                                                    Icons.email_outlined,
                                                    color: Colors.red,
                                                    size: 40,
                                                  )),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 11),
                                            child: Text(
                                              "Full Name",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 8,
                                              left: 8,
                                              top: 2,
                                            ),
                                            child: TextFormField(
                                              initialValue: user.name,
                                              decoration: InputDecoration(
                                                labelStyle: const TextStyle(
                                                    color: Colors.black),
                                                fillColor: Colors.grey[50],
                                                filled: true,
                                                border: InputBorder.none,
                                              ),
                                              enabled: false,
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 11),
                                            child: Text(
                                              "Phone",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 8,
                                              left: 8,
                                              top: 2,
                                            ),
                                            child: Stack(
                                              children: [
                                                TextFormField(
                                                  initialValue: user.phone,
                                                  decoration: InputDecoration(
                                                    labelStyle: const TextStyle(
                                                        color: Colors.black),
                                                    fillColor: Colors.grey[50],
                                                    filled: true,
                                                    border: InputBorder.none,
                                                  ),
                                                  enabled: false,
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                                Positioned(
                                                  right: 0,
                                                  top: 0,
                                                  bottom: 0,
                                                  child: IconButton(
                                                    icon: Icon(
                                                      Icons.call,
                                                      size: 30,
                                                    ),
                                                    color: Colors.green,
                                                    onPressed: () {
                                                      controller
                                                          .launchPhoneCall(
                                                              user.phone!,
                                                              context);
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 11),
                                            child: Text(
                                              "Website",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 8,
                                              left: 8,
                                              top: 2,
                                            ),
                                            child: Stack(children: [
                                              TextFormField(
                                                initialValue: user.website,
                                                decoration: InputDecoration(
                                                  labelStyle: const TextStyle(
                                                      color: Colors.black),
                                                  fillColor: Colors.grey[50],
                                                  filled: true,
                                                  border: InputBorder.none,
                                                ),
                                                enabled: false,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                              Positioned(
                                                  right: 0,
                                                  top: 0,
                                                  bottom: 0,
                                                  child: IconButton(
                                                      onPressed: () {
                                                        controller
                                                            .launchWebsite(
                                                                user.website!,
                                                                context);
                                                      },
                                                      icon: const Icon(
                                                        Icons.open_in_browser,
                                                        color: Colors.blue,
                                                        size: 30,
                                                      ))),
                                            ]),
                                          ),
                                          const SizedBox(height: 16),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 11),
                                            child: Text(
                                              "Email",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 8,
                                              left: 8,
                                              top: 2,
                                            ),
                                            child: Stack(children: [
                                              TextFormField(
                                                initialValue: user.email,
                                                decoration: InputDecoration(
                                                  labelStyle: const TextStyle(
                                                      color: Colors.black),
                                                  fillColor: Colors.grey[50],
                                                  filled: true,
                                                  border: InputBorder.none,
                                                ),
                                                enabled: false,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                              Positioned(
                                                  right: 0,
                                                  top: 0,
                                                  bottom: 0,
                                                  child: IconButton(
                                                      onPressed: () {
                                                        controller.launchEmail(
                                                            user.email!,
                                                            context);
                                                      },
                                                      icon: const Icon(
                                                        Icons.email_outlined,
                                                        color: Colors.red,
                                                        size: 30,
                                                      ))),
                                            ]),
                                          ),
                                          const SizedBox(height: 16),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 320,
                                                  height: 50,
                                                  child: ElevatedButton.icon(
                                                    onPressed: () {
                                                      // Toggle expanded address and scroll to address section
                                                      controller
                                                          .toggleExpandedAddress(
                                                              index);
                                                      controller
                                                          .scrollController
                                                          .animateTo(
                                                        controller
                                                            .scrollController
                                                            .position
                                                            .maxScrollExtent,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        curve: Curves.easeInOut,
                                                      );
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      foregroundColor:
                                                          Colors.black,
                                                      backgroundColor:
                                                          Colors.white,
                                                      elevation: 5.0,
                                                    ),
                                                    icon: const Text(
                                                      'Show Address',
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                    label: const Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: Colors.black,
                                                      size: 40,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Obx(() {
                                            return AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              height: controller
                                                          .expandedAddressItems[
                                                      index]
                                                  ? 400.0
                                                  : 0.0,
                                              child: SingleChildScrollView(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 11),
                                                        child: Text(
                                                          'Street',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 8,
                                                                left: 8,
                                                                top: 2),
                                                        child: TextFormField(
                                                          initialValue: user
                                                                  .address
                                                                  ?.street ??
                                                              '',
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.grey[50],
                                                            filled: true,
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                          enabled:
                                                              true, // Set to true if you want it to be editable
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 16),
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 11),
                                                        child: Text(
                                                          'Suite',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 8,
                                                                left: 8,
                                                                top: 2),
                                                        child: TextFormField(
                                                          initialValue: user
                                                                  .address
                                                                  ?.suite ??
                                                              '',
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.grey[50],
                                                            filled: true,
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                          enabled:
                                                              true, // Set to true if you want it to be editable
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 16),
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 11),
                                                        child: Text(
                                                          'City',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 8,
                                                                left: 8,
                                                                top: 2),
                                                        child: TextFormField(
                                                          initialValue: user
                                                                  .address
                                                                  ?.city ??
                                                              '',
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.grey[50],
                                                            filled: true,
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                          enabled:
                                                              true, // Set to true if you want it to be editable
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 16),
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 11),
                                                        child: Text(
                                                          'Zipcode',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 8,
                                                                left: 8,
                                                                top: 2),
                                                        child: TextFormField(
                                                          initialValue: user
                                                                  .address
                                                                  ?.zipcode ??
                                                              '',
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.grey[50],
                                                            filled: true,
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                          enabled:
                                                              true, // Set to true if you want it to be editable
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      SizedBox(
                                                        width: 320,
                                                        child: ElevatedButton(
                                                            onPressed: () {
                                                              controller.launchGoogleMap(
                                                                  double.tryParse(user
                                                                          .address!
                                                                          .geo!
                                                                          .lat ??
                                                                      '')!,
                                                                  double.tryParse(user
                                                                          .address!
                                                                          .geo!
                                                                          .lng ??
                                                                      '')!,
                                                                  context);
                                                            },
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(Icons
                                                                    .location_on_outlined),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "Location",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15),
                                                                )
                                                              ],
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 320,
                                                  height: 50,
                                                  child: ElevatedButton.icon(
                                                    onPressed: () {
                                                      controller
                                                          .toggleExpandedCompany(
                                                              index);
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      foregroundColor:
                                                          Colors.black,
                                                      backgroundColor:
                                                          Colors.white,
                                                      elevation: 5.0,
                                                    ),
                                                    icon: const Text(
                                                      'Show Company',
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                    label: const Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: Colors.black,
                                                      size: 40,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Obx(() {
                                            return AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              height: controller
                                                          .expandedCompanyItems[
                                                      index]
                                                  ? 270.0
                                                  : 0.0,
                                              child: SingleChildScrollView(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 11),
                                                        child: Text(
                                                          'Company Name',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 8,
                                                                left: 8,
                                                                top: 2),
                                                        child: TextFormField(
                                                          initialValue: user
                                                                  .company
                                                                  ?.name ??
                                                              '',
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.grey[50],
                                                            filled: true,
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                          enabled:
                                                              true, // Set to true if you want it to be editable
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 16),
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 11),
                                                        child: Text(
                                                          'Catch Phrase',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 8,
                                                                left: 8,
                                                                top: 2),
                                                        child: TextFormField(
                                                          initialValue: user
                                                                  .company
                                                                  ?.catchPhrase ??
                                                              '',
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.grey[50],
                                                            filled: true,
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                          enabled:
                                                              true, // Set to true if you want it to be editable
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 16),
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 11),
                                                        child: Text(
                                                          'BS',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 8,
                                                                left: 8,
                                                                top: 2),
                                                        child: TextFormField(
                                                          initialValue: user
                                                                  .company
                                                                  ?.bs ??
                                                              '',
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.grey[50],
                                                            filled: true,
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                          enabled:
                                                              true, // Set to true if you want it to be editable
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ));
  }
}
