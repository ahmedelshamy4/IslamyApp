import 'package:flutter/material.dart';

class LocationErrorWidget extends StatelessWidget {
  final String error;
  final Function callback;

  const LocationErrorWidget({required this.error,required this.callback });

  @override
  Widget build(BuildContext context) {
    const box = SizedBox(height: 32);
    const errorColor = Colors.red;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.location_off,
            size: 150,
            color: errorColor,
          ),
          box,
          Text(
            error,
            style: const TextStyle(
                fontSize: 20, color: errorColor, fontWeight: FontWeight.bold),
          ),
          box,
          TextButton(
            child: const Text('RETRY',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                )),
            onPressed: () {
              callback();
            },
          )
        ],
      ),
    );
  }
}
