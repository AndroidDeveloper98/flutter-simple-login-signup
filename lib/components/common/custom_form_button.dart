import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFormButton extends StatelessWidget {
  final String innerText;
  final void Function()? onPressed;
  const CustomFormButton({Key? key, required this.innerText, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.85,
      margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xff26D38D),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff26D38D).withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 8), // changes position of shadow
          ),
        ],
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        child: Text(innerText, style: const TextStyle(color: Colors.white, fontSize: 20),),
      ),
    );
  }
}
