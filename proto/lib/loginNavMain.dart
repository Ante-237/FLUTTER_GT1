import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:proto/NavMenuMain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CoverPage(),
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF27DCFC)),
    );
  }
}

class CoverPage extends StatelessWidget {
  const CoverPage({super.key});

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
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('Log In'),
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
                    MaterialPageRoute(builder: (context) => const SignupPage()),
                  );
                },
                child: const Text('Sign Up'),
              ),
              /*
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Login page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FirebaseForm()),
                  );
                },
                child: const Text('Firebase form'),
              ),
               */
            ],
          ),
        ),
      ),
    );
  }
}


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void signInWithGoogle() async {
    print("I got here");
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn(clientId: "323682521450-n9h7eqmumkgvh5aan8auqi3cd0osj12v.apps.googleusercontent.com");

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    final UserCredential userCredential = await auth.signInWithCredential(credential);
    print("========");
    print(userCredential.user?.email);
    print("========");
    if (!context.mounted) return;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const CreateProfilePage()),
      );

    return null;
  }

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
              Column(
                children: <Widget>[
                  // Email Field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Email'),
                      SizedBox(height: 5.0), // Add some spacing
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
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
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
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
                onPressed: () async {
                  // Implement your login logic here
                  final message = await AuthService().login(email: _emailController.text, password: _passwordController.text);
                  print('================');
                  print(message);
                  print('=================');
                  if (!context.mounted) return;
                  if (message == "success") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Lingua()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message!)));
                  }

                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 15.0), // Add some spacing between the buttons
              Column(
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Implement the forgot password functionality
                    },
                    child: const Text('Forgot Password?'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Implement the forgot password functionality
                      signInWithGoogle();
                    },
                    child: const Text('Google login'),
                  ),
                  /*
                  ElevatedButton(
                    onPressed: () async {
                      // Implement your login logic here
                      final message = await AuthService().login(email: _emailController.text, password: _passwordController.text);
                      print('================');
                      print(message);
                      print('=================');
                      if (!context.mounted) return;
                      if (message == "success") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Lingua()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message!)));
                      }

                    },
                    child: const Text('Login'),
                  ),
                   */
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPage();

}
class _SignupPage extends State<SignupPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Page'),
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
              Column(
                children: <Widget>[
                  // Email Field (for Signup)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('Email'),
                      const SizedBox(height: 5.0), // Add some spacing
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Enter Email', // Placeholder text
                          filled: true, // Fill the background
                          fillColor: Colors.white, // Background color
                          border:
                              OutlineInputBorder(), // Add rectangular border
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  // Password Field (for Signup)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('Password'),
                      const SizedBox(height: 5.0), // Add some spacing
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
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
                onPressed: () async {
                  // Implement signup logic here
                  // Navigate to the Create Profile page
                  final message = await AuthService().registration(email: _emailController.text, password: _passwordController.text);
                  print('===========');
                  print(message);
                  print('============');
                  if (!context.mounted) return;
                  if (message == "success") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateProfilePage()),
                    );
                  }
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message!)));

                },
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 15.0), // Add some spacing between the buttons
              Column(
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Navigate back to the Login page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
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
  const CreateProfilePage({super.key});

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

/*
class FirebaseForm extends StatefulWidget {
  const FirebaseForm({super.key});

  @override
  State<FirebaseForm> createState() => _FirebaseFormState();

}

class _FirebaseFormState extends State<FirebaseForm> {

  final _formKey = GlobalKey<FormState>(debugLabel: "_FirebaseFormState");
  final _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase test'),
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
              Column(
                children: <Widget>[
                  // Email Field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('Item'),
                      const SizedBox(height: 5.0), // Add some spacing
                      TextField(
                        key: _formKey,
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'Enter the details, you want to save', // Placeholder text
                          filled: true, // Fill the background
                          fillColor: Colors.white, // Background color
                          border:
                          OutlineInputBorder(), // Add rectangular border
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  // Password Field
                ],
              ),
              const SizedBox(height: 15.0),
              ElevatedButton(
                onPressed: ()  async {
                  if(_formKey.currentState!.validate()){
                  await FirebaseFirestore.instance.collection('Category').add({'category': _controller.text});
                  _controller.clear();
                  }
                },
                child: const Text('submit'),
              ),
              const SizedBox(height: 5.0,),
              ElevatedButton(
                onPressed: () async {
                  // needs to get document id to include here
                  DocumentSnapshot doc = await FirebaseFirestore.instance.collection('category').doc('id').get();
                  _controller.text = (doc['category'] as String?)!;

                },
                child: const Text('RECEIVE'),
              ),
              const SizedBox(height: 5.0,),
              ElevatedButton(
                onPressed: () async {
                  // needs to get document id to include here
                  await FirebaseFirestore.instance.collection('category').doc('id').delete();
                },
                child: const Text('DELETE CATEGORY'),
              ),
              // Add some spacing between the buttons
            ],
          ),
        ),
      ),
    );
  }
}
 */

class AuthService {
  final String name = '';
  Future<String?> registration({
    required String email,
    required String password,
}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The email is already being used. Try another one';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login({
    required String email,
    required String password,
}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "User with that email not found";
      } else if (e.code == 'wrong-password') {
        return "Wrong password, try again";
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
