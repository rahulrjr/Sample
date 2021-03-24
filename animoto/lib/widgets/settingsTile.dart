import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String titleString;
  final bool subscription;

  const SettingsTile({Key key, this.titleString, this.subscription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35,right:15,bottom:2),
      child: Container(
        height: 31,
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Text(this.titleString),
              ),
            ),
            SizedBox(
              width: 70,
            ),
            this.subscription != false
                ? Text("Free")
                : SizedBox(
                    width: 0,
                  ),
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

// return Padding(
//       padding: const EdgeInsets.only(bottom: 5),
//       child: Container(
//         height: 40,
//         child: Padding(
//           padding: const EdgeInsets.only(bottom:6),
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 0),
//               child: ListTile(
//                 title: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(padding: EdgeInsets.only(left: 20),child: Text(this.titleString),),
//                     this.subscription != false ? Text("Free") : SizedBox(width: 0,),
//                   ],
//                 ),
//                 trailing: IconButton(
//                       icon:Icon(Icons.arrow_forward_ios_rounded,size: 20,),
//                       onPressed: (){},

//                     ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
