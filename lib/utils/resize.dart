import 'package:flutter/material.dart';

double ResizeH(@required double mediaQ, @required double size){
    var result= mediaQ/size;
    return mediaQ/result;
}