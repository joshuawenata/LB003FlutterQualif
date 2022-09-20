import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lb003qualif/product.dart';

import 'detail.dart';

class ItemPage extends StatelessWidget {
  var darkmode;
  String username;
  ItemPage({super.key, required this.darkmode, required this.username});
  var products = [
    Products(title: "Simsung Galaxy Buds", image: "assets/produk/1.jpg", description: "These are true wireless earbuds, with pro-grade technology for immersive sound like never before. While Intelligent ANC lets you seamlessly switch between noise canceling and fully adjustable ambient sound. So let the outside in - or keep it out. It's your world. Galaxy Buds Pro let you hear the best of it.", price: "Rp 1.999.999,00"),
    Products(title: "Simsung Galaxy Z Flip", image: "assets/produk/2.jpg", description: "The era of planning looks around your phone is over. Small but mighty when folded, Galaxy Z Flip4 is a compact full-sized smartphone, and just the right size to slip in a pocket when it's time to slay.", price: "Rp 15.999.999,00"),
    Products(title: "Simsung Galaxy Notebook 9", image: "assets/produk/3.jpg", description: "Light and powerful.. Notebook 9", price: "Rp 24.999.999,00")    ,
    Products(title: "Simsung Galaxy Tab S", image: "assets/produk/4.jpg", description: "Get more done with the Galaxy Tab S8 series, featuring an immersive screen, upgraded performance and the ultra-fast S Pen. See what the S Series can bring to your world.", price: "Rp 10.999.999,00"),
    Products(title: "Simsung Galaxy", image: "assets/produk/5.jpg", description: "Lively Bora Purple, Striking Phantom White, knock-out Green, soft Pink Gold or classic Phantom Black — the choice isn't easy, but there's no right or wrong.", price: "Rp 15.999.999,00")    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkmode==true?Colors.blue[800]:Colors.amber[50],
      appBar: AppBar(
        title: const Text("Item Page"),
        backgroundColor: darkmode==true?const Color.fromARGB(255, 0, 18, 39):Colors.amber[400],
      ),
      body: Column(
        children: [
          Expanded(child: 
            ListView.builder(
              itemCount: products.length,
              itemBuilder: ((context, index){
                return Column(
                  children: [
                    Padding(padding: const EdgeInsets.all(20.0), child: Text(products[index].title, style: const TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.w700, fontSize: 20))),
                    Padding(padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0), child: Image.asset(products[index].image)),
                    SizedBox(width: 200, child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: darkmode==true?const Color.fromARGB(255, 0, 18, 39):Colors.amber[400],),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                          return DetailPage(tempComment: "-", tempReview: "-", username: username, darkmode: darkmode, title: products[index].title, description: products[index].description, image: products[index].image, price: products[index].price);
                        },), (route) => false);
                      },
                      child: const Text("View Detail")
                    ),)
                  ]
                );
              }),
            )
          )
        ],
      )
    );
  }
}