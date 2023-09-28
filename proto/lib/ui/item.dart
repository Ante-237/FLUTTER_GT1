import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String title;
  final String description;

  Item({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details');
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.withOpacity(0.5),
              width: 1.0,
            ),

          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
                child: Container(
                  color: Colors.grey,
                  child: Image.asset(
                    'assets/images/app_logo.png',
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(width: 16.0),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF555555),
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(
                      height:
                      4.0), // Add vertical spacing between title and description
                  Text(
                    description,
                    style:
                    const TextStyle(fontSize: 14.0, color: Color(0xFF666666)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    )
      ;
  }
}
