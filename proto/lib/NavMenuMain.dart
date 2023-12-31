
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proto/index.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*
void main() {
  runApp(const Lingua());
}
 */

class Lingua extends StatefulWidget {
  const Lingua({super.key});

  @override
  _Lingua createState() {
    return _Lingua();
  }
}

class _Lingua extends State {
  var _currentPage = 0;

  final _pages = [const Home(), const Saved(), const Profile()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lingua Pal",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue, brightness: Brightness.light),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.comfortaa(
            fontSize: 30,
            fontStyle: FontStyle.normal,
          ),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      home: Scaffold(
        body: Center(child: _pages.elementAt(_currentPage)),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.save), label: "Saved"),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Profile"),
          ],
          currentIndex: _currentPage,
          fixedColor: Colors.blue,
          onTap: (int inIndex) {
            setState(() {
              _currentPage = inIndex;
            });
          },
        ),
      ),
    );
  }
}

// page one
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('HOME')),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(4.0),
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 4.0,
        children: const [
          GridTile(child: Category()),
          GridTile(child: Category()),
          GridTile(
            child: Category(),
          ),
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
class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyAppI()),
        );
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 4, 4, 4),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    // more actions in future
                  },
                ),
              ),
              const SizedBox(height: 1),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Text('Category'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Icon(
                  Icons.cookie,
                  color: Colors.pink,
                  size: 50,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Saved extends StatelessWidget {
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
class ListSaved extends StatelessWidget {
  const ListSaved({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        leading: Icon(Icons.save),
        title: Text('Saved'),
        subtitle: Text('Description'),
      ),
    );
  }
}

/*
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
 */

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  User? user = FirebaseAuth.instance.currentUser;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Profile')),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Profile Picture Section
              const Image(
                image: AssetImage('Assets/Images/app_logo.png'),
                width: 200,
                height: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              // Text(user?. ?? "default"),
              TextField(
                readOnly: true,
                controller: nameController..text = user?.displayName ??  user?.email?.split("@")[0] ?? "user 1",
                // decoration: const InputDecoration(
                //     label: Text("display name")),
              ),
              TextField(
                readOnly: true,
                controller: emailController..text = user?.email ?? "current email",
                // decoration: const InputDecoration(
                //     label: Text("Email")),
              ),
              const SizedBox(
                height: 30,
              ),
              const TextField(
                maxLength: 30,
                maxLengthEnforcement: MaxLengthEnforcement.none,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  labelText: 'Name',
                  hintText: 'Enter Preferred Name',
                  helperText: 'avoid spaces',
                ),
              ),
              const TextField(
                maxLength: 20,
                maxLengthEnforcement: MaxLengthEnforcement.none,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  labelText: 'Email',
                  hintText: 'Enter Preferred Email',
                  helperText: 'avoid spaces',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement save profile logic here

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Lingua()),
                  );
                },
                child: const Text('Save Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
