
import 'package:flutter/material.dart';
import 'package:proto/NavMenuMain.dart';
import 'package:proto/app_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




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
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: const Text('Sign Up'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Login page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirebaseForm()),
                  );
                },
                child: const Text('Firebase form'),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Lingua()),
                  );
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


class FirebaseForm extends StatefulWidget {
  const FirebaseForm({super.key});

  @override
  State<FirebaseForm> createState() => _FirebaseFormState();

}

class _FirebaseFormState extends State<FirebaseForm> {

  final _formKey = GlobalKey<FormState>(debugLabel: "_FirebaseFormState");
  final _controller = TextEditingController();

  //template  update  operation
  Future<void> updateDocumentCategory(String documentId, Map<String, dynamic> updatedData) async{
    await FirebaseFirestore.instance.collection('Category').doc(documentId).update(updatedData);
  }


  //template create operations
  Future<void> addDocumentCategory(Map<String, dynamic> data) async{
    CollectionReference collection = FirebaseFirestore.instance.collection('Category');
    await collection.add(data);
  }


  // template  read operation
  Future<QuerySnapshot> GetAllDocuments(String id) async {
    CollectionReference collection = FirebaseFirestore.instance.collection(id);
    return await collection.get();
  }


  //  template delete operation
  Future<void> deleteDocumentCategory(String documentId) async{
    CollectionReference collection = FirebaseFirestore.instance.collection('Category');
    await collection.doc(documentId).delete();
  }



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
                  //if(_formKey.currentState!.validate()){
                  Map<String, dynamic> ObjectData = {'category', 'Food and New' } as Map<String, dynamic> ;
                  await updateDocumentCategory('id_0', ObjectData );
                   // await FirebaseFirestore.instance.collection('Category').add({'category': _controller.text});
                    //_controller.clear();
                 // }
                },
                child: const Text('CREATE / SUBMIT'),
              ),
              const SizedBox(height: 5.0,),
              ElevatedButton(
                onPressed: () async {
                  // needs to get document id to include here
                  DocumentSnapshot doc = await FirebaseFirestore.instance.collection('category').doc('id_0').get();
                  _controller.text = (doc['category'] as String?)!;

                },
                child: const Text('READ AND UPDATE'),
              ),
              const SizedBox(height: 5.0,),
              ElevatedButton(
                onPressed: () async {

                  // needs to get document id to include here
                  await deleteDocumentCategory('id_0');
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
