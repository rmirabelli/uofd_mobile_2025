import 'package:flutter/material.dart';

class HeroDetail extends StatefulWidget {
  final String title;
  const HeroDetail(this.title, {super.key});

  @override
  State<HeroDetail> createState() => _HeroDetailState();
}

class _HeroDetailState extends State<HeroDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 150),
          Hero(
            tag: widget.title,
            child: Material(child: Text(widget.title, style: TextStyle(fontSize: 42))),
          ),
        ],
      ),
    );
  }
}
