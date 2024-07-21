import 'package:flutter/material.dart';

class AppStyle{
     static var boxDecoration = BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.25))
            ]);
}