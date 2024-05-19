

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_provider/slider/slider_provider.dart';
import 'package:provider/provider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    final slideProvider = Provider.of<SliderProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return Slider(
                  min: 0,
                  max: 1,
                  value: value.sliderValue, onChanged: (val){
                value.slider(val);
                // setState(() {
                //   print(val);
                // });
              });
            },
          ),
          Consumer<SliderProvider>(
            builder: (context,value,child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.red.withOpacity(value.sliderValue),
                      child: Center(child: Text("Container 1")),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.green.withOpacity(value.sliderValue),
                      child: Center(child: Text("Container 2")),
                    ),
                  )
                ],
              );
            }
          )
        ],
      ),
    );
  }
}
