import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFiled extends StatefulWidget {
  final String headText;
  final String hintText;
  final String? icon;
  final bool isPassword;
  final TextEditingController controller;
  const AppTextFiled(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.headText,
      this.icon,
      this.isPassword = false});

  @override
  State<AppTextFiled> createState() => _AppTextFiledState();
}

class _AppTextFiledState extends State<AppTextFiled> {
  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.headText,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        SizedBox(height: 10),
        TextFormField(
          obscureText: isSecure && widget.isPassword,
          decoration: InputDecoration(
              hintText: widget.hintText,
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          isSecure = !isSecure;
                        });
                      },
                      child: Icon(isSecure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined),
                    )
                  : null,
              prefixIcon:
                  widget.icon != null ? Image.asset(widget.icon!) : null,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(width: 2, color: Colors.grey)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(width: 2, color: Colors.grey))),
        ),
      ],
    );
  }
}
