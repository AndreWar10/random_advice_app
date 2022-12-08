import 'package:flutter/material.dart';
import '../../domain/entitites/random_advice_entitie.dart';

class RandomAdviceListViewWidget extends StatelessWidget {
  const RandomAdviceListViewWidget({
    Key? key,
    required this.advice,
  }) : super(key: key);

  final RandomAdviceEntitie advice;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, int index) {
          return ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Text(advice.slip.id.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
            title: Text(advice.slip.advice!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          );
        },
        separatorBuilder: (_, __) => Divider(),
        itemCount: 1);
  }
}
