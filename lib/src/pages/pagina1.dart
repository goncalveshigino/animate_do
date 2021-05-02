import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'navegacion_page.dart';
import 'twitter_page.dart'; 


class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animate_to'), 
        actions: [

          IconButton(
            icon:  FaIcon(FontAwesomeIcons.twitter), 
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> TwitterPage()));
            },
          ),

          SlideInLeft(
            from: 100,
            child: IconButton(
              icon:  Icon(Icons.navigate_next), 
              onPressed: (){
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context)=> Pagina1Page()));
              },
            ),
          ),

        ],
      ),


      floatingActionButton: BounceInDown(
        child: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.play),
          onPressed:(){
             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> NavegacionPage()));
          }, 
        ),
      ),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             
             ElasticIn(
               delay: Duration( milliseconds: 1100),
               child: Icon(Icons.new_releases, color: Colors.blue, size: 40)
              ), 
 
             FadeInDown(
               delay: Duration( milliseconds: 200),
               child: Text('Titulo', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200))
             ), 

             FadeInDown(
               delay: Duration( milliseconds: 800),
               child: Text('Texto Pequeno', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
             ), 

             FadeInLeft(
               delay: Duration( milliseconds: 800),
               child: Container(
                 width: 220, 
                 height: 2,
                 color: Colors.blue,
               ),
             )
          ],
        ),
      ),
    );
  }
}