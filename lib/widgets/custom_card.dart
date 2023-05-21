import 'package:flutter/material.dart';
import 'package:listview_batch30/widgets/custom_snackcbar.dart';

class KCard extends StatelessWidget {
  const KCard({
    required this.title,
    required this.deleteFunction,
    super.key,
  });

  final String title;
  final Function deleteFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // showSnacBar(context, title);
      },
      onDoubleTap: () {
        deleteFunction();
      },
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Card(
          color: Colors.amberAccent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
