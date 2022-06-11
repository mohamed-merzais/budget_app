import 'package:budget_app/Screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/SignUpScreen.dart';

//used to control the email and pw
var emailController = TextEditingController();
var passwordController = TextEditingController();
//used to store errors to be then printed using a snackbar
var error = StringBuffer();
//used for eye icon to view pw
bool pwVisibility = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //calculates size of screen and font to keep it adapted to each device
    var phoneHeight = MediaQuery.of(context).size.height;
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneFont = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: phoneHeight,
            width: phoneWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //insert logo here
                Image.asset(
                    '/Users/mohamedmerzais/BitBucketRepo/budgetapp/budget_app/Assets/Images/Logo.png'),
                const Padding(padding: EdgeInsets.all(10)),
                //below is email textfield
                TextFormField(
                  key: const ValueKey("Email"),
                  textAlign: TextAlign.left,
                  decoration: const InputDecoration(
                    hintText: " Email ",
                    prefixIcon: Icon(Icons.email),
                  ),
                  controller: emailController,
                ),
                //password field
                const Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  key: const ValueKey("Password"),
                  textAlign: TextAlign.left,
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: " Password ",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                        child: Icon(Icons.visibility),
                      )),
                  controller: passwordController,
                ),
                //forgot password button
                const Padding(padding: EdgeInsets.all(10)),
                TextButton(
                    onPressed: () async {
                      if (emailController.text == '') {
                        const snackBar = SnackBar(
                          content: Text('please enter a valid email'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: emailController.text);
                        const snackBar =
                            SnackBar(content: Text('Reset email sent out'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: const Text(
                      "forgot password?",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    )),
                //login button
                const Padding(padding: EdgeInsets.all(5)),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () async {
                      try {
                        //stores email and pw as credentials. then checks to see if is correct
                        var credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        //once user signs mohin user is taken to home page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                        //clears textfield
                        emailController.clear();
                        passwordController.clear();
                        //error handling
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          error.write('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          error.write('Wrong password provided for that user');
                        }
                        print(error);
                      }
                      //print error to snackbar
                      final snackBar = SnackBar(
                        content: Text(error.toString()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      error.clear();
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                //new user
                const SizedBox(
                  height: 10,
                ),
                //user is taken to sign up page
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  child: const Text("New User? Create Account"),
                ),
              ],
            ),
          ),
        ));
  }
}
