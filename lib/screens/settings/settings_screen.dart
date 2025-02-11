import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "language",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).primaryColor, width: 2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "English",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 14),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  size: 20,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
