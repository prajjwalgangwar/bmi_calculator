import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  final String title;
  final Function()? onIncrement;
  final Function()? onDecrement;
  final int counterValue;

  const CounterCard(
      {super.key,
      required this.title,
      this.onIncrement,
      this.onDecrement,
      this.counterValue = 0});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Card(
        shadowColor: Colors.purple.shade900,
        elevation: 10,
        child: Container(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(25)),
                            child: IconButton(
                                onPressed: onDecrement,
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            '$counterValue',
                            style: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(25)),
                            child: IconButton(
                                onPressed: onIncrement,
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
