import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Comment extends StatefulWidget {
  Comment({Key key}) : super(key: key);

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.15,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Comments",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(FontAwesomeIcons.times),
                  )
                ],
              ),
            ),
            Divider(
              color: Color(0xffE4E4E4),
              thickness: 1.5,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    child: Text("B"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 8, 8, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        decoration: BoxDecoration(
                            color: Color(0xffE4E4E4),
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10.0, 8, 8, 8),
                              child: Text("Balogun Micheal"),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10.0, 8, 8, 8),
                              child: Text(
                                  "This recipe should come very fast already. We can't wait any longer. Although,, the Bible said Man shall not leave by bread alone but, in this case i'm sure he'll understand."),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("1h"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Like"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Reply"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
