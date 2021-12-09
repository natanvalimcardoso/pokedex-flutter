import 'package:flutter/material.dart';

class HomeLoading extends StatefulWidget {
  const HomeLoading({ Key? key }) : super(key: key);

  @override
  _HomeLoadingState createState() => _HomeLoadingState();
}

class _HomeLoadingState extends State<HomeLoading> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      // ignore: prefer_const_constructors
      body: Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}