import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/components/common/custom_search_field_with_category.dart';

import '../common/custom_search_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? selectedValue;
  List<String> vegatablesList = [
    'assets/images/cabbage.png',
    'assets/images/sweet_potato.png',
    'assets/images/green_beans.png',
    'assets/images/fresh_broccoli.png',
    'assets/images/potato.png',
    'assets/images/tomato.png',
  ];

  @override
  void initState() {
    super.initState();
    selectedValue = vegatablesList.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      appBar: AppBar(
        toolbarHeight: 76,
        elevation: 0, // Set this height
        flexibleSpace: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 18.0),
            child: Column(
              children: [
                const SizedBox(height: 56),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => {Navigator.pop(context)},
                      child: Container(
                        height: 36,
                        width: 36,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFFF7F7F7),
                                Color(0xFFF7F7F7),
                              ],
                              begin: FractionalOffset(0.0, 0.0),
                              end: FractionalOffset(1.0, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 4, bottom: 4, left: 4, right: 5.5),
                            child: Image.asset(
                              'assets/icons/ic_back.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Flexible(
                      child: Text("Search",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    GestureDetector(
                      onTap: () => {Navigator.pop(context)},
                      child: Container(
                        height: 36,
                        width: 36,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFFF7F7F7),
                                Color(0xFFF7F7F7),
                              ],
                              begin: FractionalOffset(0.0, 0.0),
                              end: FractionalOffset(1.0, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 10, right: 10),
                            child: Image.asset(
                              'assets/icons/ic_close.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 24.0, right: 18.0, bottom: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const SearchScreen()))
                      },
                      child: CustomSearchWithCategory(
                        hintText: 'Search by item name',
                        textInputAction: TextInputAction.done,
                        isDense: true,
                        obscureText: true,
                        validator: (textValue) {
                          if (textValue == null || textValue.isEmpty) {
                            return 'Password is required!';
                          }
                          return null;
                        },
                        suffixIcon: true,
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("154+ Result Found",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xff1B1B1B),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text("Cancel",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xff1B1B1B),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.only(top: 5.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 18),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      itemCount: vegatablesList.length,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.only(bottom: 32),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, mainAxisExtent: 222),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    height: 120,
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      color: Colors.white,
                                      child: Image.asset(
                                        vegatablesList[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      height: 32,
                                      width: 32,
                                      margin: const EdgeInsets.only(
                                          right: 12, top: 12),
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              Color(0xFFF8F8F8),
                                              Color(0xFFF8F8F8),
                                            ],
                                            begin: FractionalOffset(0.0, 0.0),
                                            end: FractionalOffset(1.0, 0.0),
                                            stops: [0.0, 1.0],
                                            tileMode: TileMode.clamp),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(24)),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4,
                                              bottom: 4,
                                              left: 4,
                                              right: 4),
                                          child: Image.asset(
                                            'assets/icons/ic_heart.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 16.0, right: 16),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Fresh Cabbage",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color(0xff1B1B1B),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 16.0, top: 6.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Organic",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color(0xffA1A1A1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal)),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16.0, top: 6.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Row(
                                        children: [
                                          Text("\u0024 5.65",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                          Text("/kg",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color(0xffA1A1A1),
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ],
                                      ),
                                      Container(
                                        height: 32,
                                        width: 32,
                                        margin:
                                            const EdgeInsets.only(right: 12),
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF26E698),
                                                Color(0xFF16C07B),
                                              ],
                                              begin: FractionalOffset(0.0, 0.0),
                                              end: FractionalOffset(1.0, 0.0),
                                              stops: [0.0, 1.0],
                                              tileMode: TileMode.clamp),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(24)),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 2,
                                                bottom: 3.5,
                                                left: 2,
                                                right: 2),
                                            child: Image.asset(
                                              'assets/icons/ic_add.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
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
          ],
        ),
      ),
    );
  }
}
