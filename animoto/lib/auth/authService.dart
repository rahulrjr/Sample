import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthService{
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn = GoogleSignIn();
  

  // Future<User> signIn()async{

  //   GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  //   GoogleSignInAuthentication gsA = await googleSignInAccount.authentication;

    
  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken:gsA.accessToken,
  //     idToken:gsA.idToken
  //   );

  //   final UserCredential authResult = await _auth.signInWithCredential(credential);

  //   final User user= authResult.user;

  //   assert(!user.isAnonymous);

  //   assert(await user.getIdToken() != null);
    
  //   final User currentUser =  _auth.currentUser;

  //   assert(currentUser.uid == user.uid);

  //   print(user.email);

  //   return user;

  // }


FirebaseAuth _auth;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<User> signInWithGoogle() async {

  FirebaseApp defaultApp = await Firebase.initializeApp();
  _auth = FirebaseAuth.instanceFor(app: defaultApp);
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);


   UserCredential authResult = await _auth.signInWithCredential(credential);

  
  final User user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final User currentUser = await _auth.currentUser;
  
  assert(currentUser.uid == user.uid);

  return user;
}

void signOutGoogle() async {
  await googleSignIn.signOut();
}

  



}