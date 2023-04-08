import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final String? Function(String?) validator;
  final bool suffixIcon;
  final bool? isDense;
  final bool obscureText;
  final TextEditingController? textEditingController;

  const CustomInputField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.validator,
      this.suffixIcon = false,
      this.isDense,
      this.textEditingController,
      this.obscureText = false})
      : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  //
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.labelText,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Card(
            margin: const EdgeInsets.only(top: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 5,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                controller: widget.textEditingController,
                obscureText: (widget.obscureText && _obscureText),
                decoration: InputDecoration(
                  isDense: (widget.isDense != null) ? widget.isDense : false,
                  hintText: widget.hintText,
                  border: InputBorder.none,
                  suffixIcon: widget.suffixIcon
                      ? IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.remove_red_eye
                                : Icons.visibility_off_outlined,
                            color: Colors.black54,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        )
                      : null,
                  suffixIconConstraints: (widget.isDense != null)
                      ? const BoxConstraints(maxHeight: 33)
                      : null,
                ),
                //autovalidateMode: AutovalidateMode.onUserInteraction,
                //validator: widget.validator,
              ),
            ),
          )
        ],
      ),
    );
  }
}
