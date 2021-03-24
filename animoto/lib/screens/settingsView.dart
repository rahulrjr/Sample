import 'package:animoto/auth/authService.dart';
import 'package:animoto/bloc/userBloc/user_bloc.dart';
import 'package:animoto/widgets/customDivider.dart';
import 'package:animoto/widgets/header.dart';
import 'package:animoto/widgets/settingsTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {

  AuthService authService = AuthService();
  // GoogleSignIn googleSignIn = GoogleSignIn();
  
  // logout()async{
  //  await FirebaseAuth.instance.signOut();
  //   googleSignIn.signOut();
  // }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: BlocBuilder<UserBloc, UserState>(
        // ignore: missing_return
        builder: (context, state) {
          if (state is UserInitial) {
            return Container();
          }
          if (state is UserLoadingState) {
            BlocProvider.of<UserBloc>(context).add(LoadAccountEvent());
            return Container(child: Center(child: CircularProgressIndicator()));
          }
          if (state is UserLoadedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                Header(
                  headerName: "SETTINGS",
                ),
                CustomDivider(),
                SizedBox(
                  height: 25,
                ),
                premiumBanner(),
                SizedBox(
                  height: 35,
                ),
                accountTile(state.user.name,state.user.email),
                Divider(
                  thickness: 1.5,
                ),
                SettingsTile(
                  titleString: 'Profile Information',
                  subscription: false,
                ),
                state.user.prime == true ?Divider(
                  thickness: 1.5,
                  indent: 35,
                ):Container(),

                state.user.prime == true ? SettingsTile(
                  titleString: 'Brand Settings',
                  subscription: false,
                ):Container(),
                Divider(
                  thickness: 1.5,
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 245),
                  child: Text(
                    "ACCOUNT",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 1.5,
                ),
                SettingsTile(
                  titleString: 'Subscription',
                  subscription: true,
                ),
                Divider(
                  thickness: 1.5,
                ),
                InkWell(
                  onTap: (){
                    authService.signOutGoogle();
                    Navigator.pushNamed(context,'login');
                  },
                  child: SettingsTile(
                    titleString: 'Logout',
                    subscription: false,
                  ),
                ),
                Divider(
                  thickness: 1.5,
                ),
                
              ],
            );
          }
        },
      )),
    );
  }
}

Widget accountTile(String name,String email) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: ListTile(
      title: Text(
        name,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        email,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.account_circle_outlined,
            size: 50,
            color: Colors.blue[900],
          )),
    ),
  );
}

Widget premiumBanner() {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: Container(
      height: 90,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 10.5, right: 10.5, top: 5),
          title: Text(
            "Upgrade to a premium plan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          subtitle: Text(
            "Get unlimited videos without a water mark",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          trailing: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Colors.blue[900],
            child: Text(
              "UPGRADE",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              print("upgrade");
            },
          ),
        ),
      ),
    ),
  );
}
