import 'package:animoto/mocks/model/templateModel.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';

class Template extends StatefulWidget {
  final int index;
  // final String image;
  // final String name;
  // final String description;
  final TemplateModel template;

  const Template({Key key, this.index, this.template}) : super(key: key);

  // const Template({Key key, this.image, this.name, this.description}) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      height: 700,
      width: 200,
      child: widget.index == 0
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  child: FDottedLine(
                    corner: FDottedLineCorner.all(8),
                    dottedLength: 5,
                    space: 1,
                    color: Colors.black45,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(widget.template.imagePath),
                          ),
                          // color: Colors.blue,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${widget.template.name}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "${widget.template.description}",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                )
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(widget.template.imagePath),
                      ),
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(8)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${widget.template.name}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "${widget.template.description}",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                )
              ],
            ),
    );
  }
}
