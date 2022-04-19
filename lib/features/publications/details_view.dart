import 'package:flutter/material.dart';
import 'package:publication_app/constant_widgets/appbarView.dart';

class DetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: appBarWithSearch(context),
      body: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          ListTile(
              leading: Text("S.N",
                  style: TextStyle(
                      fontSize: theme.headline6.fontSize,
                      fontWeight: FontWeight.w500)),
              title: Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text("Book Name ",
                    style: TextStyle(

                        ///95207  2528
                        fontSize: theme.headline6.fontSize,
                        fontWeight: FontWeight.w500)),
              ),
              // subtitle: Padding(
              //   padding: const EdgeInsets.only(left: 12.0),
              //   child: Text("Address",
              //       style: TextStyle(
              //           fontSize: theme.subtitle1.fontSize,
              //           fontWeight: FontWeight.w400)),
              // ),
              trailing: Text("Price",
                  style: TextStyle(
                      fontSize: theme.headline6.fontSize,
                      fontWeight: FontWeight.w500))),
          ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (ctx, i) {
                return ListTile(
                  leading: Text("${i + 1}",
                      style: TextStyle(
                          fontSize: theme.headline6.fontSize,
                          fontWeight: FontWeight.w500)),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text("Book Name ${i + 1}",
                        style: TextStyle(

                            ///95207  2528
                            fontSize: theme.headline6.fontSize,
                            fontWeight: FontWeight.w500)),
                  ),
                  // subtitle: Padding(
                  //   padding: const EdgeInsets.only(left: 12.0),
                  //   child: Text("Address",
                  //       style: TextStyle(
                  //           fontSize: theme.subtitle1.fontSize,
                  //           fontWeight: FontWeight.w400)),
                  // ),
                  trailing: Text(
                    "Rs. 3${i * 5}",
                    style: TextStyle(
                        fontSize: theme.headline6.fontSize,
                        fontWeight: FontWeight.w500),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
