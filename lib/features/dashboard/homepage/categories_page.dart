import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:publication_app/controllers/home_controller.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({Key key}) : super(key: key);
  final HomeController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Obx(
      () => _controller.homepageData.value.banner == null
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                await _controller.getCategoryData();
              },
              child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Wrap(
                    children: List.generate(
                        _controller.categoryApi.value.data.length, (index) {
                      return Text(_controller
                          .categoryApi.value.data[index].title
                          .toString());
                    }),
                  )),
            ),
    ));
  }
}
