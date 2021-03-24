import 'package:animoto/bloc/templateBloc/template_bloc.dart';
import 'package:animoto/mocks/model/templateModel.dart';
// import 'package:animoto/mocks/readTemplates.dart';
import 'package:animoto/widgets/template.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowTemplates extends StatefulWidget {
  @override
  _ShowTemplatesState createState() => _ShowTemplatesState();
}

class _ShowTemplatesState extends State<ShowTemplates> {
  List<TemplateModel> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadFromAsset().then((value) {
      list = value;
      print(list.length);
    });
  }

  load() async {
    list = await loadFromAsset();
    print(list.length);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Text(
                "CHOOSE A TEMPLATE",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            Divider(
              indent: 175,
              endIndent: 171,
              thickness: 1.5,
              color: Colors.blue[400],
            ),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<TemplateBloc, TemplateState>(
              // ignore: missing_return
              builder: (context, state) {
                if (state is TemplateInitial) {
                  return Container();
                }
                if (state is TemplatesLoadingState) {
                  BlocProvider.of<TemplateBloc>(context)
                      .add(GetTemplateEvent());
                  return CircularProgressIndicator();
                }
                if (state is TemplatesLoadedState) {
                  return Flexible(
                    child: GridView.builder(
                      itemCount: list.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                        childAspectRatio: 3 / 6,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical:10),
                            child: Template(
                              index: index,
                              template: list[index],
                            ));
                      },

                      // children: List.generate(10, (index) {
                      //   return
                      //   Padding(
                      //     padding: const EdgeInsets.all(10.0),
                      //     child: Template(index: index,)
                      // Container(
                      //   // color: Colors.amber,
                      //   height: 700,
                      //   width: 200,
                      //   child: index == 0
                      //       ? Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Container(
                      //               height: 300,
                      //               child: FDottedLine(
                      //                 corner: FDottedLineCorner.all(8),
                      //                 dottedLength: 5,
                      //                 space: 1,
                      //                 color: Colors.black45,
                      //                 child: Container(
                      //                   decoration: BoxDecoration(
                      //                       image: DecorationImage(
                      //                         fit: BoxFit.fill,
                      //                         image: AssetImage(
                      //                             'assets/images/image1.jpeg'),
                      //                       ),
                      //                       // color: Colors.blue,
                      //                       borderRadius:
                      //                           BorderRadius.circular(8)),
                      //                 ),
                      //               ),
                      //             ),
                      //             SizedBox(
                      //               height: 10,
                      //             ),
                      //             Text(
                      //               "Start from scratch",
                      //               style: TextStyle(fontWeight: FontWeight.bold),
                      //             ),
                      //             Text(
                      //               "Create a video story from scratch to tell your story",
                      //               style: TextStyle(
                      //                   fontWeight: FontWeight.normal,
                      //                   fontSize: 12),
                      //             )
                      //           ],
                      //         )
                      //       : Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [

                      //             Container(
                      //               height: 300,
                      //               decoration: BoxDecoration(
                      //                   color: Colors.blue,
                      //                   borderRadius: BorderRadius.circular(8)),
                      //             ),
                      //             SizedBox(
                      //               height: 10,
                      //             ),
                      //             Text(
                      //               "Start from scratch",
                      //               style: TextStyle(fontWeight: FontWeight.bold),
                      //             ),
                      //             Text(
                      //               "Create a video story from scratch to tell your story",
                      //               style: TextStyle(
                      //                   fontWeight: FontWeight.normal,
                      //                   fontSize: 12),
                      //             )
                      //           ],
                      //         ),
                      // ),
                      // );
                      // }
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
