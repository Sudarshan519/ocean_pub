import 'package:flutter/material.dart';
import 'package:publication_app/constant_widgets/appbarView.dart';
import 'package:publication_app/features/publications/details_view.dart';
import 'package:publication_app/utils/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class PublicationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: appBarWithSearch(context, title: 'Publications'),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListView.builder(
            itemCount: dummies.length,
            itemBuilder: (context, i) {
              return ExpansionTile(
                  title: Text(
                    dummies[i].levelName,
                    style: TextStyle(
                        fontSize: theme.headline6.fontSize,
                        fontWeight: FontWeight.w400),
                  ),
                  children: [
                    for (var dropItem in dummies[i].classDetails) ...[
                      InkWell(
                        onTap: () {
                          //goto details
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsView()));
                        },
                        child: Container(
                          height: context.screenWidth * 0.08,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                dropItem.bookname,
                                style: TextStyle(
                                  fontSize: theme.subtitle1.fontSize,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              // Text(
                              //   dropItem.price.toString(),
                              //   style: TextStyle(
                              //     fontSize: theme.subtitle1.fontSize,
                              //     fontWeight: FontWeight.w400,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ]
                  ]
                  // dummies[i]
                  //     .dropDownDetails
                  //     .map((e) => Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //           children: <Widget>[
                  //             Text(e.bookname),
                  //             Text('Rs. ${e.price}'),
                  //           ],
                  //         ))
                  //     .toList(),
                  );
            },
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}

class Dummy {
  final String levelName;
  final List<DropDownDetails> classDetails;

  Dummy({this.classDetails, this.levelName});
}

class DropDownDetails {
  final String bookname;
  final int price;

  DropDownDetails({this.bookname, this.price});
}

List<Dummy> dummies = [
  Dummy(levelName: 'School', classDetails: [
    DropDownDetails(bookname: 'Class One'),
    DropDownDetails(bookname: 'Class Two'),
    DropDownDetails(bookname: 'Class Three'),
    DropDownDetails(bookname: 'Class Four'),
    DropDownDetails(bookname: 'Class Five'),
    DropDownDetails(bookname: 'Class Six'),
    DropDownDetails(bookname: 'Class Seven'),
    DropDownDetails(bookname: 'Class Eight'),
    DropDownDetails(bookname: 'Class Nine'),
    DropDownDetails(bookname: 'Class Ten'),
  ]),
  Dummy(levelName: 'College', classDetails: [
    DropDownDetails(bookname: 'Class XI'),
    DropDownDetails(bookname: 'Class XII'),
  ]),
  Dummy(levelName: 'References', classDetails: []),
  Dummy(levelName: 'Others', classDetails: []),
];
