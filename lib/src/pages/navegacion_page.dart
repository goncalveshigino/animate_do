import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart'; 


class PavigacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
  create: (_) => _NotificationModel(),
      child: Scaffold(

        appBar: AppBar(
          title: const Text(
            'Navigacions Page', 
            style: TextStyle(
              fontSize: 20, 
              color: Colors.white
            ),
          ),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),


        floatingActionButton: BottonFlutuante(),


        bottomNavigationBar: BottomNavigation(),
        
      ),
    );
  }
}

class BottonFlutuante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
       child: FaIcon( FontAwesomeIcons.play),
       backgroundColor: Colors.pink, 
       onPressed: (){
         int number = Provider.of<_NotificationModel>(context, listen: false).number;
         number++;

         Provider.of<_NotificationModel>(context, listen: false).number = number;

         if(number >= 2 ){
           final controller = Provider.of<_NotificationModel>(context).bounceController;
           controller.forward( from: 0.0);
         }
       },
    );
  }
}


class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final int number = Provider.of<_NotificationModel>(context).number;


    return BottomNavigationBar(
      currentIndex: 0, 
      selectedItemColor: Colors.pink, 
      items: [

        BottomNavigationBarItem(
          // ignore: deprecated_member_use
          title: const Text('Bone'),
          icon: FaIcon( FontAwesomeIcons.bone)
        ), 

        BottomNavigationBarItem(
          // ignore: deprecated_member_use
          title: const Text('Notifications'),
          icon: Stack(
            children: [
              FaIcon( 
                FontAwesomeIcons.bell
              ),
              Positioned(
                top: 0.0, 
                right: 0.0,
                // child: Icon(
                //   Icons.brightness_1, 
                //   color: Colors.redAccent, 
                //   size: 14
                // ),
                child: BounceInDown(
                  from: 20,
                  animate: (number > 0) ? true : false,
                    child: Bounce(
                      from: 20,
                      controller: (controller) => Provider.of<_NotificationModel>(context).bounceController = controller,
                      child: Container(
                      child: Text('$number', style: TextStyle( 
                        color: Colors.white, 
                        fontSize:9
                        ),
                        
                      ), 
                      alignment: Alignment.center,
                      width: 14, 
                      height: 14, 
                      decoration: BoxDecoration(
                        color: Colors.redAccent, 
                        shape: BoxShape.circle
                      ),
                  ),
                    ),
                ),
              )
            ],
          )
        ),

        BottomNavigationBarItem(
          // ignore: deprecated_member_use
          title: const Text('My Dog'),
          icon: FaIcon( FontAwesomeIcons.dog)
        ),

      ],
    );
  }
}


class _NotificationModel extends ChangeNotifier {

  int _number = 0;
  AnimationController _bounceController;

  int get number => this._number;

  set number( int value){
    this._number = value;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;

  set bounceController( AnimationController controller) {
    this._bounceController = controller; 
    notifyListeners();
  }
}