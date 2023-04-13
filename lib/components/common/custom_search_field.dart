import 'package:flutter/material.dart';

class CustomSearchField extends StatefulWidget {
  final String hintText;
  final String? Function(String?) validator;
  final bool suffixIcon;
  final bool? isDense;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final TextEditingController? textEditingController;

  const CustomSearchField(
      {Key? key,
      required this.hintText,
      required this.validator,
      this.suffixIcon = false,
      this.isDense,
      this.textEditingController,
      this.textInputAction,
      this.obscureText = false})
      : super(key: key);

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  //
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xffe8e8e8),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: TextFormField(
          style:  TextStyle(color: Color(0xff000000)),
            textInputAction: (widget.textInputAction != null)
                ? widget.textInputAction
                : TextInputAction.next,
            controller: widget.textEditingController,
            decoration: InputDecoration(
              isDense: (widget.isDense != null) ? widget.isDense : false,
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Color(0xffA1A1A1)),
              border: InputBorder.none,
              prefixIcon: widget.suffixIcon
                  ? const ImageIcon(AssetImage("assets/icons/ic_search.png"),color: Colors.grey,)
                  : null,
              prefixIconConstraints: (widget.isDense != null)
                  ? const BoxConstraints(maxHeight: 33,minWidth: 38)
                  : null,
            ),
            //autovalidateMode: AutovalidateMode.onUserInteraction,
            //validator: widget.validator,
          ),
        ),
      ),
    );
  }
}
