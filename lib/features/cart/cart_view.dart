import 'package:esewa_pnp/esewa.dart';
import 'package:esewa_pnp/esewa_pnp.dart';
import 'package:flutter/material.dart';
import 'package:publication_app/base/base_view.dart';
import 'package:publication_app/utils/colors.dart';
import 'package:publication_app/utils/assets.dart';
import 'package:publication_app/utils/reusable_widgets/elevated_stacked_image.dart';
import 'package:publication_app/utils/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:publication_app/utils/extensions.dart';

import 'cart_viewmodel.dart';

var buttonRadius = 4.0;

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<CartViewModel>(
      viewModel: CartViewModel(),
      onModelReady: (vm) {
        vm.getCartItems();
      },
      builder: (context, viewmodel, _) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade300,
          bottomNavigationBar: viewmodel.cartItems.length == 0
              ? Container(height: 0.0)
              : InkWell(
                  onTap: () {
                    int totalquantities = 0;
                    int totalPrice = 0;

                    viewmodel.cartItems.forEach((element) {
                      totalquantities += element.quantity;
                      totalPrice += (element.price * element.quantity);
                    });
                    showDialog(
                      context: context,
                      builder: (context) => CartSummaryWidget(
                        quantity: totalquantities,
                        totalPrice: totalPrice,
                      ),
                    );
                  },
                  child: Container(
                    color: colorPrimary,
                    width: double.infinity,
                    height: 55.0,
                    child: Center(
                      child: text(
                        "Checkout".toUpperCase(),
                        textColor: Colors.white,
                        fontweight: FontWeight.bold,
                        fontSize: context.textTheme.subtitle1.fontSize,
                      ),
                    ),
                  ),
                ),
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: text(
              "My Cart",
              textColor: whiteColor,
              fontweight: FontWeight.bold,
              fontSize: context.textTheme.headline6.fontSize,
            ),
            automaticallyImplyLeading: false,
            backgroundColor: colorPrimary,
            centerTitle: true,
          ),
          // appBar: appBarWithSearch(context, title: "Cart"),
          body: viewmodel.cartItems.length == 0
              ? Center(
                  child: text(
                    "No items added in the cart",
                    fontweight: FontWeight.w600,
                    fontSize: context.textTheme.subtitle2.fontSize,
                  ),
                )
              : SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      10.heightBox,
                      ListView.builder(
                        itemBuilder: (context, index) => Container(
                          // color: Colors.green,
                          child: FittedBox(
                            child: StackedElevatedImage(
                              detailsWidget: checkoutItemDetail(
                                viewmodel.cartItems[index],
                                onTappedRemoveButton: () =>
                                    viewmodel.removeItemFromCart(
                                  viewmodel.cartItems[index].id,
                                  index: index,
                                ),
                              ),
                              height: context.screenHeight * 0.2,
                              image: viewmodel.cartItems[index].image,
                            ),
                          ),
                        ),
                        itemCount: viewmodel.cartItems.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      ),

                      // 15.heightBox,
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 8.0),
                      //   child: packageContainer(context, "Shop more"),
                      // ),
                      10.heightBox,
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget checkoutItemDetail(CartItem item, {Function onTappedRemoveButton}) {
    return Stack(
      children: [
        LayoutBuilder(
          builder: (context, constrains) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(
                  item.name,
                  maxLine: 1,
                  isCentered: false,
                  fontweight: FontWeight.w500,
                  fontSize: context.textTheme.headline6.fontSize,
                ),
                3.heightBox,
                text(
                  item.author == "" ? "Package" : "${item.author}",
                  isCentered: false,
                  fontweight: FontWeight.w600,
                  fontSize: context.textTheme.subtitle2.fontSize,
                ),
                3.heightBox,
                text(
                  "${item.price * item.quantity}".toCurrency,
                  isCentered: false,
                  // decoration: TextDecoration.lineThrough,
                  fontweight: FontWeight.w400,
                  fontSize: context.textTheme.subtitle2.fontSize,
                ),
                // Container(
                //   child: text(
                //     "fhajkf", //      "${widget.item.offerPrice}".toCurrency,
                //     textColor: Colors.green,
                //     isCentered: true,
                //     fontweight: FontWeight.w500,
                //     fontSize: context.textTheme.subtitle2.fontSize,
                //   ),
                // ),
                5.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //
                        _incr_decr_Button(
                          constrains,
                          icon: Icons.remove,
                          action: () {
                            item.quantity--;
                          },
                        ),
                        Container(
                          height: 25.0,
                          width: constrains.maxWidth * 0.15,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Center(
                            child: text(
                              "${item.quantity}",
                              isCentered: true,
                              textColor: Colors.grey,
                              fontSize: context.textTheme.subtitle2.fontSize,
                            ),
                          ),
                        ),
                        _incr_decr_Button(
                          constrains,
                          icon: Icons.add,
                          action: () {
                            item.quantity++;
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomOutlineButton(
                          onTapped: onTappedRemoveButton,
                        ),
                        5.widthBox,
                      ],
                    ),
                  ],
                )
              ],
            );
          },
        ),
        Positioned(
          right: 3.0,
          top: 3.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon(
                item.type == "Video"
                    ? videoIcon
                    : item.type == "Package"
                        ? packageIcon
                        : bookIcon,
                width: 18.0,
                height: 18.0,
              ),
              2.widthBox,
              text(item.type),
            ],
          ),
        ),
      ],
    );
  }

  Widget _incr_decr_Button(BoxConstraints constrains,
      {IconData icon, Function action}) {
    return InkWell(
      onTap: () {
        setState(() {
          action();
        });
      },
      child: Container(
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: icon == Icons.add
              ? BorderRadius.only(
                  topRight: Radius.circular(buttonRadius),
                  bottomRight: Radius.circular(buttonRadius),
                )
              : BorderRadius.only(
                  topLeft: Radius.circular(buttonRadius),
                  bottomLeft: Radius.circular(buttonRadius),
                ),
          border: Border.all(color: Colors.grey),
        ),
        child: Icon(
          icon,
          color: Colors.grey[600],
          size: 18.0,
        ),
      ),
    );
  }
}

class CartSummaryWidget extends StatelessWidget {
  final dynamic totalPrice;
  final int quantity;
  const CartSummaryWidget({this.totalPrice, this.quantity});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: context.screenWidth * 0.95,
              padding: EdgeInsets.fromLTRB(7.0, 12.0, 7.0, 7.0),
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius:
                      BorderRadius.circular(context.screenWidth * 0.015)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  text(
                    "Your Cart Summary",
                    fontweight: FontWeight.w700,
                    fontSize: context.textTheme.subtitle1.fontSize + 3,
                  ),
                  15.heightBox,
                  Padding(
                    padding: EdgeInsets.only(left: context.screenWidth * 0.05),
                    child: Column(
                      children: [
                        // summaryDetails(
                        //   title: "Bookname",
                        //   detail: item.title,
                        // ),
                        // divider(),
                        summaryDetails(
                          title: "Total Quantity",
                          detail: "$quantity",
                        ),
                        // divider(),
                        summaryDetails(
                          title: "Subtotal",
                          detail: "$totalPrice".toCurrency,
                        ),
                        // divider(),
                        summaryDetails(
                            title: "Discount", detail: "0".toCurrency),
                        dottedLine(),
                        summaryDetails(
                          title: "Grand Total",
                          detail: "$totalPrice".toCurrency,
                          color: blackColor,
                        ),
                        8.heightBox,
                        // divider(),
                      ],
                    ),
                  ),
                  8.heightBox,
                  Container(
                    // color: Colors.red,
                    // height: context.screenHeight * 0.15,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        text(
                          "Proceed your Payment with".toUpperCase(),
                          fontweight: FontWeight.w700,
                          fontSize: context.textTheme.subtitle2.fontSize + 3,
                        ),
                        15.heightBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Container(
                                  height: context.screenWidth * 0.1,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                    image: DecorationImage(
                                        image: AssetImage(esewaIcon),
                                        fit: BoxFit.fitWidth),
                                  ),
                                  child: InkWell(
                                    child: icon(
                                      esewaIcon,

                                      width: double.infinity,
                                      // width: context.screenWidth * 0.25,
                                    ),
                                    // borderSide: BorderSide(color: colorPrimary),
                                    onTap: () async {
                                      //
                                      ESewaConfiguration _configuration =
                                          ESewaConfiguration(
                                              clientID:
                                                  "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
                                              secretKey:
                                                  "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
                                              environment: ESewaConfiguration
                                                  .ENVIRONMENT_TEST //ENVIRONMENT_LIVE
                                              );
                                      ESewaPnp _eSewaPnp = ESewaPnp(
                                          configuration: _configuration);
                                      ESewaPayment _payment = ESewaPayment(
                                        amount: 564,
                                        productName: "Ocean Publication",
                                        productID: "Ocn pub",
                                        callBackURL: "",
                                      );
                                      try {
                                        final _res =
                                            await _eSewaPnp.initPayment(
                                          payment: _payment,
                                        );

                                        print(_res.message);
                                        print(_res.status);
                                        // Handle success
                                      } on ESewaPaymentException catch (e) {
                                        // Handle error
                                        print(e.toString());
                                      }
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              // ignore: deprecated_member_use
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    //
                                  },
                                  // borderSide: BorderSide(color: colorPrimary),
                                  child: text("Cash on Delivery"),
                                ),
                              )
                            ],
                          ),
                        ),
                        5.heightBox,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget summaryDetails({String title, String detail, Color color}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            Container(
              width: constraints.maxWidth * 0.45,
              child: text(
                "$title",
                maxLine: 1,
                fontweight: FontWeight.w500,
                textColor: color ?? Colors.grey.shade600,
              ),
            ),
            Container(
              width: constraints.maxWidth * 0.5,
              child: text(
                "$detail",
                fontSize: context.textTheme.subtitle2.fontSize,
                maxLine: 1,
                textColor: color ?? Colors.grey.shade600,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget dottedLine() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: List.generate(
          50,
          (index) => Expanded(
            child: Container(
              color: index % 2 == 0 ? Colors.transparent : Colors.grey,
              height: 2,
            ),
          ),
        ),
      ),
    );
  }
}
