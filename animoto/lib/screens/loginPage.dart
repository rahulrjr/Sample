import 'package:animoto/auth/authService.dart';
import 'package:animoto/screens/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  // bool isUserSignedIn = false;
  AuthService authService = AuthService();
  // FirebaseAuth _auth;
  // GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  initState() {
    super.initState();
    
    // initApp();
  }

  // void initApp() async {
    
  //   FirebaseApp defaultApp = await Firebase.initializeApp();
  //   _auth = FirebaseAuth.instanceFor(app: defaultApp);
  // }

  void click() {
    authService.signInWithGoogle().then((user) => {
          // this.user = user,
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePage()))
        });
  }


  // void checkIfUserSignedIn() async {
  //   var userSignedIn = await googleSignIn.isSignedIn();

  //   setState(() {
  //     isUserSignedIn = userSignedIn;
  //   });
  // }

  List<Widget> loginWidgets = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 180,
          ),
          Container(
            child: Center(
              child: Text(
                "Login with google",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 150,
            child: RaisedButton(
              color: Colors.amberAccent,
              child: Text("Login"),
              onPressed: this.click,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29)),
            ),
          ),
        ]),
      ),
    ));
  }

  // Future<User> handleSignIn() async {
  //   User user;
  //   bool userSignedIn = await googleSignIn.isSignedIn();

  //   print(userSignedIn);

  //   setState(() {
  //     isUserSignedIn = userSignedIn;
  //   });

  //   if (isUserSignedIn) {
  //     user = _auth.currentUser;
  //     print(user.displayName);
  //   } else {
  //     GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  //     GoogleSignInAuthentication gsA = await googleSignInAccount.authentication;

  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: gsA.accessToken, idToken: gsA.idToken);

  //     UserCredential authResult = await _auth.signInWithCredential(credential);

  //     User user = authResult.user;
    
  //     // user =( await _auth.signInWithCredential(credential)).user;
  //     userSignedIn = await googleSignIn.isSignedIn();
  //     print("inside else");
  //     print(userSignedIn);
  //     setState(() {
  //       isUserSignedIn = userSignedIn;
  //     });
  //   }
  //   return user;
  // }

  // void onGoogleSIgnIn() async {

  //   User user = await handleSignIn();
  //   var userSignedIn =  Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => HomePage(),
  //       ));

  //   print("inside onGoogleSignIn =  $userSignedIn");

    
  //   setState(() {
  //     isUserSignedIn = userSignedIn == null ? true : false;
  //   });
  // }
}




















// import 'package:animoto/auth/authService.dart';
// import 'package:animoto/screens/homePage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
  
//   bool isUserSignedIn = false;

//   FirebaseAuth _auth;
//   GoogleSignIn googleSignIn = GoogleSignIn();

//   @override
//   initState() {
//     super.initState();
//     initApp();
//   }

//   void initApp() async {
//     FirebaseApp defaultApp = await Firebase.initializeApp();
//     _auth = FirebaseAuth.instanceFor(app: defaultApp);
//   }

//   void checkIfUserSignedIn() async {
//     var userSignedIn = await googleSignIn.isSignedIn();

//     setState(() {
//       isUserSignedIn = userSignedIn;
//     });
//   }

//   List<Widget> loginWidgets = [];
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: SingleChildScrollView(
//         child: Column(children: [
//           SizedBox(
//             height: 180,
//           ),
//           Container(
//             child: Center(
//               child: Text(
//                 "Login with google",
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Container(
//             width: 150,
//             child: RaisedButton(
//               color: Colors.amberAccent,
//               child: Text("Login"),
//               onPressed: () async {
//                 onGoogleSIgnIn();
//               },
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(29)),
//             ),
//           ),
//         ]),
//       ),
//     ));
//   }

//   Future<User> handleSignIn() async {
//     User user;
//     bool userSignedIn = await googleSignIn.isSignedIn();

//     print(userSignedIn);

//     setState(() {
//       isUserSignedIn = userSignedIn;
//     });

//     if (isUserSignedIn) {
//       user = _auth.currentUser;
//       print(user.displayName);
//     } else {
//       GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//       GoogleSignInAuthentication gsA = await googleSignInAccount.authentication;

//       final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: gsA.accessToken, idToken: gsA.idToken);

//       UserCredential authResult = await _auth.signInWithCredential(credential);

//       User user = authResult.user;
    
//       // user =( await _auth.signInWithCredential(credential)).user;
//       userSignedIn = await googleSignIn.isSignedIn();
//       print("inside else");
//       print(userSignedIn);
//       setState(() {
//         isUserSignedIn = userSignedIn;
//       });
//     }
//     return user;
//   }

//   void onGoogleSIgnIn() async {

//     User user = await handleSignIn();
//     var userSignedIn =  Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => HomePage(),
//         ));

//     print("inside onGoogleSignIn =  $userSignedIn");

    
//     setState(() {
//       isUserSignedIn = userSignedIn == null ? true : false;
//     });
//   }
// }
