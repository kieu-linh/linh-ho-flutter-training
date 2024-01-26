import 'dart:convert';

import 'package:api_app_flutter/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductModel productModel = ProductModel();
  Future<http.Response> fetchProduct() {
    return http.get(Uri.parse('https://dummyjson.com/products'));
  }

  @override
  void initState() {
    super.initState();
    fetchProduct().then((value) {
      print(value.body);
      final data = jsonDecode(value.body);
      productModel = (ProductModel.fromData(data));
      print(productModel.products?[1].images);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text(productModel.products?[index].description ?? ''),
                SizedBox(
                  height: 200.0,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, imageIndex) {
                        return Image.network(
                            productModel.products?[index].images?[imageIndex] ??
                                '');
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 20.0),
                      itemCount:
                          productModel.products?[index].images?.length ?? 0),
                )
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 20.0),
          itemCount: productModel.products?.length ?? 0),
    );
  }
}
