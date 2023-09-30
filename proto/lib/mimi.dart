import 'package:flutter/material.dart';
import 'package:proto/NavMenuMain.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CoverPage(),
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF27DCFC)),
    );
  }
}

class CoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Add the app logo at the top-center
              Image.asset(
                'Assets/Images/app_logo.png', // Replace with your app logo asset path
                width: 300.0,
                height: 300.0,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Go to app for slangs in local areas compared to your previous locations',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Login page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Log In'),
              ),
              const SizedBox(height: 10.0),
              const Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'or',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              TextButton(
                onPressed: () {
                  // Navigate to the Signup page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Add the app logo at the top-center
              Image.asset(
                'Assets/Images/app_logo.png', // Replace with your app logo asset path
                width: 300.0,
                height: 300.0,
              ),
              const SizedBox(height: 5.0),
              const Column(
                children: <Widget>[
                  // Email Field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Email'),
                      SizedBox(height: 5.0), // Add some spacing
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter Email', // Placeholder text
                          filled: true, // Fill the background
                          fillColor: Colors.white, // Background color
                          border:
                              OutlineInputBorder(), // Add rectangular border
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  // Password Field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Password'),
                      SizedBox(height: 5.0), // Add some spacing
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter Password', // Placeholder text
                          filled: true, // Fill the background
                          fillColor: Colors.white, // Background color
                          border:
                              OutlineInputBorder(), // Add rectangular border
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              ElevatedButton(
                onPressed: () {
                  // Implement your login logic here
                },
                child: Text('Login'),
              ),
              SizedBox(height: 15.0), // Add some spacing between the buttons
              Column(
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Implement the forgot password functionality
                    },
                    child: Text('Forgot Password?'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to the Signup page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Page'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Add the app logo at the top-center
              Image.asset(
                'Assets/Images/app_logo.png', // Replace with your app logo asset path
                width: 300.0,
                height: 300.0,
              ),
              const SizedBox(height: 5.0),
              const Column(
                children: <Widget>[
                  // Email Field (for Signup)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Email'),
                      SizedBox(height: 5.0), // Add some spacing
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter Email', // Placeholder text
                          filled: true, // Fill the background
                          fillColor: Colors.white, // Background color
                          border:
                              OutlineInputBorder(), // Add rectangular border
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  // Password Field (for Signup)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Password'),
                      SizedBox(height: 5.0), // Add some spacing
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter Password', // Placeholder text
                          filled: true, // Fill the background
                          fillColor: Colors.white, // Background color
                          border:
                              OutlineInputBorder(), // Add rectangular border
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              ElevatedButton(
                onPressed: () {
                  // Implement signup logic here
                  // Navigate to the Create Profile page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateProfilePage()),
                  );
                },
                child: Text('Sign Up'),
              ),
              const SizedBox(height: 15.0), // Add some spacing between the buttons
              Column(
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Navigate back to the Login page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Text('Already have an account? Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreateProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Profile Page'),
      ),
      body: Center(
        child: Padding(
          padding: const  EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Profile Picture Section
              Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 10.0,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add_a_photo,
                    size: 120.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              // Full Name Section
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Full Name'),
                  SizedBox(height: 5.0),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Full Name',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              // Save Profile Button
              ElevatedButton(
                onPressed: () {
                  // Implement save profile logic here
                  MaterialPageRoute(builder: (context) => const Lingua());
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
