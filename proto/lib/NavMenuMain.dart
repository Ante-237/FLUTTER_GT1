import 'package:flutter/material.dart';


void main() {
  runApp(const Lingua());
}

class Lingua extends  StatefulWidget{
  const Lingua({super.key});

  @override
  _Lingua createState() {
    return _Lingua();
  }
}

class _Lingua extends State {

  var _currentPage = 0;

  final _pages = [
    const Home(),
    const Saved(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Lingua Pal",
    home: Scaffold(
      body: Center(child: _pages.elementAt(_currentPage)),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Profile"),
        ],
        currentIndex: _currentPage,
        fixedColor: Colors.green,
        onTap: (int inIndex){
          setState(() {
            _currentPage = inIndex;
          }
          );
        },
      ),
    ),
    );
  }
}


// page one
class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('HOME')),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(4.0),
        crossAxisCount: 2, childAspectRatio: 1.0,
        mainAxisSpacing: 4.0, crossAxisSpacing : 2.0,
        children: const [
          GridTile(child: Category()),
          GridTile(child: Category()),
          GridTile(child: Category(),),
          GridTile(child: Category()),
          GridTile(child: Category()),
          GridTile(child: Category()),
          GridTile(child: Category()),
        ],
      ),
    );
  }
}


// categories in grid view
class  Category extends StatelessWidget{
  const Category({super.key});

  @override
  Widget build(BuildContext context){
    return const Card(
      color: Color.fromARGB(100, 255, 255, 1),
      shadowColor: Color.fromARGB(10, 100, 100, 100),
      child: Icon(Icons.bolt),

      );
  }
}

class Saved extends StatelessWidget{
  const Saved({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('SAVED')),
      ),
      body: ListView(
      children: const <Widget>[
        ListSaved(),
        ListSaved(),
        ListSaved(),
        ListSaved(),
      ],
      ),
    );
  }
}

// item list widget
class ListSaved extends StatelessWidget{
  const ListSaved({super.key});

  @override
  Widget build(BuildContext context){
    return const ListTile(
      leading: Icon(Icons.save),
      title: Text('Saved'),
      subtitle: Text('Description'),
    );
  }
}

class Profile extends StatelessWidget{
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('PROFILE')),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }
}