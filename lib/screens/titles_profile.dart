import 'package:flutter/material.dart';

class TitleProfile extends StatelessWidget {
  const TitleProfile(this.screenTitle, this.titleRatings, {Key? key}) : super(key: key);
  final String screenTitle;
  final String titleRatings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: Text(
                screenTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 32.0
                ),
                softWrap: true,
              ),
            ),
          ),
          Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.thumb_up, color: Colors.blueGrey,),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Icon(Icons.thumb_down, color: Colors.blueGrey,),
                    ),
                    Text('IMDb - $titleRatings', style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),)
                  ])
              )
          )
        ],
      ),
    );
  }
}
