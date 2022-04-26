import 'package:flutter/material.dart';
import 'package:publication_app/constant_widgets/appbarView.dart';
import 'package:publication_app/utils/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class ContactUsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: appBarWithSearch(context, title: 'Contact Us'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth / 10),
        shrinkWrap: true,
        //
        children: [
          //

          10.heightBox,
          TextFormField(
            maxLines: 1,
            decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0))),
          ),
          10.heightBox,
          TextFormField(
            maxLines: 1,
            decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0))),
          ),
          10.heightBox,
          TextFormField(
            maxLines: 1,
            decoration: InputDecoration(
                hintText: "Phone",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0))),
          ),
          10.heightBox,
          TextFormField(
            maxLines: 4,
            decoration: InputDecoration(
                hintText: "Message",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0))),
          ),
          10.heightBox,
          Container(
              height: context.screenWidth / 10,
              padding:
                  EdgeInsets.symmetric(horizontal: context.screenWidth / 6),
              child: ElevatedButton(
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {},
                child: Text(
                  "Submit",
                  style: TextStyle(
                      fontSize: theme.button.fontSize + 5,
                      fontWeight: FontWeight.w500),
                ),
              )
              // borderSide: BorderSide(color: Colors.blue)),
              )
        ],
      ),
    );
  }
}
