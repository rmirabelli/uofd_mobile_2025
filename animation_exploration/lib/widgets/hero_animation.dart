import 'package:flutter/material.dart';
import 'hero_detail.dart';

class HeroAnimation extends StatefulWidget {
  const HeroAnimation({super.key});

  @override
  State<HeroAnimation> createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimation> {
  final list = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext ctx, int index) {
        return ListTile(
          leading: CircleAvatar(backgroundColor: Colors.amber, child: Text('${index + 1}')),
          title: Hero(
            tag: list[index],
            child: Material(child: Text(list[index])),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return HeroDetail(list[index]);
                },
              ),
            );
          },
        );
      },
    );
  }
}
