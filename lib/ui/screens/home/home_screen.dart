import 'package:bloc_contact_app/ui/screens/screens.dart';
import 'package:bloc_contact_app/ui/screens/contacts/contacts.dart';
import 'package:bloc_contact_app/ui/screens/counter/counter.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key, this.title }) : super(key: key);

  final String? title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

   
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
     
     _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
      );
      

      _animation = CurvedAnimation(
        parent: _animationController, 
        curve: Curves.fastOutSlowIn);
      
    super.initState();
  }

 
  


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
            actions: [
            IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ContactScreen.routeName);
            },
            icon: const Icon(Icons.navigation)),

            IconButton(
            onPressed: () {
              Navigator.pushNamed(context, CounterScreen.routeName);
            },
            icon: const Icon(Icons.countertops)),
          
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(SettingScreen.routeName);
            },
            icon: const Icon(Icons.settings))
        ],
      ),
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: const Icon(Icons.account_balance, size: 80),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //_animationController.repeat(reverse: true);
        },
        child: AnimatedIcon(
          icon: AnimatedIcons.play_pause, 
          progress: _animation),
      ),
      
    );
  }
}