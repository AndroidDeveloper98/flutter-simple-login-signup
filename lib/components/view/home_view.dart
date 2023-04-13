import 'package:flutter/material.dart';
import 'package:login_signup/components/common/custom_search_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                    backgroundImage:
                        AssetImage('assets/images/casey_placeholder.png'),
                  ),
                ),
                const Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
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
                        padding:
                            EdgeInsets.only(left: 16.0, right: 8.0, top: 8.0),
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(), //<-- SEE HERE
                      padding: const EdgeInsets.all(14),
                      backgroundColor: Colors.green),
                  child: const SizedBox(
                      height: 20,
                      child: ImageIcon(
                          AssetImage("assets/icons/shopping_cart.png"))),
                ),
              ],
            ),
            const SizedBox(height: 18),
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
          ],
        ),
      ),
    );
  }
}
