import 'package:flutter/material.dart';
import 'package:frontend/molecules/top_bar_main.dart';
import 'package:frontend/util/custom_box.dart';
import 'package:frontend/molecules/ranking.dart';
import 'package:frontend/molecules/category_list_cvs.dart';
import 'package:frontend/molecules/horizontal_list.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

import 'package:frontend/molecules/category_list_genre.dart';

import '../models/product_simple.dart';
import '../util/reommendation_api.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarMain(appBar: AppBar(),),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('\'뒤로\'버튼을 한번 더 누르시면  종료됩니다.'),
        ),
        child: ListView(
          children: [
            CategoryList(),
            CategoryGenreList(),
            CustomBox(),
            HorizontalList(title: '오늘의 추천 상품',
                apiFunction: RecommendationApi.getRecommendationList()),
            CustomBox(),
            Ranking(),
          ],
        ),
      ),
    );
  }
}



