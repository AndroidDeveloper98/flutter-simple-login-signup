import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/components/common/custom_search_field.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../login_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? selectedValue;
  List<String> sortFilter = [
    'Vegetable',
    'Fruit',
    'Dairy',
    'Dry Fruits',
    'Food Oil'
  ];

  @override
  void initState() {
    super.initState();
    selectedValue = sortFilter.first;
  }

  @override
  Widget build(BuildContext context) {
    void logOut() async {
      await FirebaseAuth.instance.signOut();
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (context) => const LoginPage()));
    }

    void logoutDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: const Text('Are you sure to logout ?'),
          actions: <TextButton>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () {
                logOut();
              },
              child: const Text('Logout'),
            )
          ],
        ),
      );
    }

    final controller = PageController(keepPage: true);
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      appBar: AppBar(
        toolbarHeight: 86,
        elevation: 0,// Set this height
        flexibleSpace: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 18.0),
            child: Column(
              children: [
                const SizedBox(height: 56),
                Row(
                  children: [
                    const SizedBox(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/casey_placeholder.png'),
                      ),
                    ),
                    const Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding:
                              EdgeInsets.only(left: 16.0, right: 16.0),
                              child: Row(
                                children: [
                                  Text("Hi",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                  Text(", Casey",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal)),
                                ],
                              )),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 16.0, right: 8.0, top: 8.0),
                            child: Text("What would you buy today ?",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal)),
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        logoutDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(), //<-- SEE HERE
                          padding: const EdgeInsets.all(14),
                          backgroundColor: const Color(0xff26D38D)),
                      child: const SizedBox(
                          height: 20,
                          child: ImageIcon(AssetImage(
                              "assets/icons/shopping_cart.png"))),
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
                padding: const EdgeInsets.only(left: 24.0, right: 18.0, bottom: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12),
                    CustomSearchField(
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
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 140,
                      child: PageView(
                        controller: controller,
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                            child: Image.asset(
                              'assets/images/page_view_image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                            child: Image.asset(
                              'assets/images/page_view_image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                            child: Image.asset(
                              'assets/images/page_view_image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffF8F8F8),
                        border: Border.all(color: Colors.white70),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SmoothPageIndicator(
                          controller: controller,
                          count: 3,
                          effect: const ExpandingDotsEffect(
                            dotHeight: 10,
                            dotWidth: 10,
                            dotColor: Color(0xffD9D9D9),
                            activeDotColor: Color(0xff26D38D),
                            // strokeWidth: 5,
                          ),
                        ),
                      ),
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
                    height: 32.0,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    color: Colors.white,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            selectedValue = sortFilter[index];
                            setState(() {});
                          },
                          child: Container(
                            height: 32,
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              gradient: selectedValue == sortFilter[index]
                                  ? const LinearGradient(
                                      colors: [
                                        Color(0xFF26E698),
                                        Color(0xFF16C07B),
                                      ],
                                      begin: FractionalOffset(0.0, 0.0),
                                      end: FractionalOffset(1.0, 0.0),
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.clamp)
                                  : const LinearGradient(
                                      colors: [
                                        Color(0xFFC9C9C9),
                                        Color(0xFFC9C9C9),
                                      ],
                                      begin: FractionalOffset(0.0, 0.0),
                                      end: FractionalOffset(1.0, 0.0),
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                              border: Border.all(color: Colors.white70),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(24)),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 12),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.white70),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(24)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset(
                                            'assets/images/carrat_image.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        sortFilter[index].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.0),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        );
                      },
                      itemCount: sortFilter.length,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Best Seller",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color(0xff1B1B1B),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 24.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text("See All",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color(0xff20CC87),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      itemCount: sortFilter.length,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.only(bottom: 32),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, mainAxisExtent: 224),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/tomato.png',
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 16.0, right: 16),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Chinese Fresh Cabbage",
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
                                padding: EdgeInsets.only(left: 16.0, top: 6.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
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
                                                  fontWeight: FontWeight.normal)),
                                        ],
                                      ),
                                      Container(
                                        height: 32,
                                        width: 32,
                                        margin: EdgeInsets.only(right: 12),
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              colors: [
                                                Color(0xFF26E698),
                                                Color(0xFF16C07B),
                                              ],
                                              begin: FractionalOffset(0.0, 0.0),
                                              end: FractionalOffset(1.0, 0.0),
                                              stops: [0.0, 1.0],
                                              tileMode: TileMode.clamp),
                                          border:
                                          Border.all(color: Colors.white70),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(24)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset(
                                            'assets/icons/ic_add.png',
                                            fit: BoxFit.cover,
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
