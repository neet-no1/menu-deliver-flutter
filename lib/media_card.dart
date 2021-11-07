import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

import 'openapi_factory.dart';

final List<String> imgList = [
  'https://www.menu-deliver.com/public/menu_images/16_DqMFsL8xyzbUTKHEyqA8mA==',
  'https://www.menu-deliver.com/public/menu_images/16_DqMFsL8xyzbUTKHEyqA8mA==',
  'https://www.menu-deliver.com/public/menu_images/16_DqMFsL8xyzbUTKHEyqA8mA==',
  'https://www.menu-deliver.com/public/menu_images/16_DqMFsL8xyzbUTKHEyqA8mA==',
  'https://www.menu-deliver.com/public/menu_images/16_DqMFsL8xyzbUTKHEyqA8mA==',
  'https://www.menu-deliver.com/public/menu_images/16_DqMFsL8xyzbUTKHEyqA8mA==',
  'https://www.menu-deliver.com/public/menu_images/16_DqMFsL8xyzbUTKHEyqA8mA==',
  'https://www.menu-deliver.com/public/menu_images/16_DqMFsL8xyzbUTKHEyqA8mA==',
];

class MediaCard extends StatelessWidget {
  final Size size;

  MediaCard(this.size);

  List<Widget> imageSliders(BuildContext context, List<String> imgList) {
    return imgList
        .map((item) => GestureDetector(
              onTap: () {

                final api = OpenApiFactory().build(baseUrl: 'http://10.0.2.2:48080/api').getLoginApi();
                final String email = 'ts344585@ca2.so-net.ne.jp'; // String | メールアドレス
                final String password = 's3hiroyoshi'; // String | パスワード

                try {
                  final response = api.login(email: email, password: password);
                  //print(response);
                  response.then((value) => print(value.data?.info));
                } catch(e) {
                print('Exception when calling LoginApi->login: $e\n');
                }
                Navigator.pushNamed(context, '/menu_view');
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: size.width / 3,
                    width: size.width / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1.0,
                          blurRadius: 1.0,
                          offset: Offset(3, 3),
                        ),
                      ],
                      /* ここまでを追加しました */
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(item, fit: BoxFit.fitHeight),
                    ),
                  ),
                ),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: imageSliders(context, imgList),
      ),
    );
  }
}
