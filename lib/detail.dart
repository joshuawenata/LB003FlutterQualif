import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lb003qualif/item.dart';

class DetailPage extends StatefulWidget {
  String username;
  var darkmode;
  String title;
  String image;
  String description;
  String price;
  String tempReview;
  String tempComment;

  DetailPage({super.key, required this.username, required this.darkmode, required this.title, required this.description, required this.image, required this.price, required this.tempReview, required this.tempComment});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController reviewController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  void handleReview(){
    String review = reviewController.text;
    String comment = commentController.text;

    if(review.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Review is required!")));
      return;
    }
    if(comment.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Comment is required!")));
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Review and Comment has been added!"))
    );

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return DetailPage(username: widget.username, darkmode: widget.darkmode, title: widget.title, description: widget.description, image: widget.image, price: widget.price, tempReview: review, tempComment: comment,);
    },), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      backgroundColor: widget.darkmode==true?Colors.blue[800]:Colors.amber[50],
      appBar: AppBar(
        title: const Text("Detail Page"),
        backgroundColor: widget.darkmode==true?const Color.fromARGB(255, 0, 18, 39):Colors.amber[400],
        bottom: const TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.info),
            ),
            Tab(
              icon: Icon(Icons.comment),
            )
          ]
        ),
      ),
      body: TabBarView(children: [
        SingleChildScrollView(child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(20.0), child: Text(textAlign: TextAlign.justify, widget.title, style: const TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.w700, fontSize: 20))),
            Padding(padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0), child: Image.asset(widget.image)),
            Padding(padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0), child: Text(textAlign: TextAlign.justify, widget.description, style: const TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.w700, fontSize: 15))),
            Padding(padding: const EdgeInsets.all(20.0), child: Text(textAlign: TextAlign.justify, widget.price, style: const TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.w700, fontSize: 12))),
            SizedBox(width: 200, child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: widget.darkmode==true?const Color.fromARGB(255, 0, 18, 39):Colors.amber[700]),
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                  return ItemPage(darkmode: widget.darkmode, username: widget.username,);
                },), (route) => false);
              },
              child: const Text("Back to item page")
            )),
            
            Padding(padding: const EdgeInsets.all(20.0), child: TextField(style: const TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.w700), controller: reviewController, decoration: const InputDecoration(hintText: "Review"))),
            Padding(padding: const EdgeInsets.all(20.0), child: TextField(style: const TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.w700), controller: commentController, decoration: const InputDecoration(hintText: "Comment"))),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: widget.darkmode==true?const Color.fromARGB(255, 0, 18, 39):Colors.amber[700]),
              onPressed: () {
                handleReview();
              },
              child: const Text("Add review & comment")
            ),

          ]
        )),
        Column(
          children: [
            Padding(padding: const EdgeInsets.all(30.0), child: Column(children: [
              Text("Review by ${widget.username}", style: const TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.w700, fontSize: 20))
            ])),
            Text(widget.tempReview, style: const TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.w700, fontSize: 15)),
            Padding(padding: const EdgeInsets.all(30.0), child: Column(children: [
              Text("Comment by ${widget.username}", style: const TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.w700, fontSize: 20))
            ])),
            Text(widget.tempComment, style: const TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.w700, fontSize: 15)),
            ],
        )
      ],)
    ));
  }
}