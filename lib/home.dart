import 'package:flutter/material.dart';
import 'package:lb003qualif/item.dart';
import 'package:lb003qualif/login.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  String username;

  HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var darkmode = false;

  @override
  Widget build(BuildContext context) {
    var images = ['assets/1.jpg','assets/2.jpg','assets/3.jpg','assets/4.jpg','assets/5.jpg'];
    return Scaffold(
      backgroundColor: darkmode==true?Colors.blue[900]:Colors.amber[50],
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: darkmode==true?const Color.fromARGB(255, 0, 18, 39):Colors.amber[400],
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: images.map((e) => Image.asset(e, width: 300, height: 300)).toList(),
            options: CarouselOptions(
              height: 400, autoPlay: true, 
              autoPlayInterval: const Duration(seconds: 3)
            )
          ),
          const Padding(padding: EdgeInsets.all(20.0), child: Text(textAlign: TextAlign.justify, style: TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.w700, fontSize: 15) ,"Simsung, South Korean company that is one of the world’s largest producers of electronic devices. Samsung specializes in the production of a wide variety of consumer and industry electronics, including appliances, digital media devices, semiconductors, memory chips, and integrated systems. It has become one of the most-recognizable names in technology!"))
          ],
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: darkmode==true?Colors.blue[800]:Colors.amber[50]
        ),
        child: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text("Welcome, ${widget.username}", style: const TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.w700, fontSize: 20)),
              ),
              Padding(padding: const EdgeInsets.only(top: 100), child: 
                ListTile(
                  title: const Text("Item Page", style: TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.w700, fontSize: 20)),
                  leading: Image.asset("assets/item.png", height: 40, width: 50,),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: ((context){
                      return ItemPage(darkmode: darkmode, username: widget.username);
                    })), (route) => false);
                  }
                )
              ),
              Padding(padding: const EdgeInsets.only(top: 200), child: Container(
                child: Column(
                  children: [
                    SwitchListTile(
                      title: const Text("DarkMode", style: TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.w700, fontSize: 20)),
                      value: darkmode,
                      onChanged: (value) {
                        setState(() {
                          darkmode = value;
                        });
                      },
                    ),
                    ListTile(
                      title: const Text("Logout", style: TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.w700, fontSize: 20)),
                      leading: Image.asset("assets/logout.png", height: 200),
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: ((context){
                          return const LoginPage();
                        })), (route) => false);
                      },
                    )
                    ],
                )
              ),)
            ],
          ),
        ),
      )
    );
  }
}