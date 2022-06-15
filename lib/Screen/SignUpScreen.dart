import 'package:budget_app/Screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();
var error = StringBuffer();

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                //logo
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
                const Padding(padding: EdgeInsets.all(10)),

                //sign up button
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
                        var credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        ///once user has signed up pushed to main scree
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                        // clears the text fields
                        emailController.clear();
                        passwordController.clear();
                        //error handling
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          error.write('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          error.write(
                              'The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                      //print error to snackbar
                      var snackBar = SnackBar(
                        content: Text(error.toString()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      error.clear();
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                //allows user to go back to login page
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Go back to login page"),
                ),
              ],
            ),
          ),
        ));
  }
}
