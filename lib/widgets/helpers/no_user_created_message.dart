import 'package:flutter/material.dart';

class NoUserCreatedMessage extends StatelessWidget {
  const NoUserCreatedMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.error_outline, size: 50, color: Colors.red),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              textAlign: TextAlign.center,
              "Ups... It seems like no user has been created yet. Create one please",
              style: TextStyle(
                fontSize: 18,
              ),
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}
