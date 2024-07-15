import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_for_route/api/api_manager.dart';
import 'package:task_for_route/cubit/home_cubit.dart';
import 'package:task_for_route/cubit/home_state.dart';
import 'package:task_for_route/ui/uitis/dialog.dart';

import '../../../model/products.dart';
import '../../widget/item_product.dart';
import '../../widget/search_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const String routeName = "HomeScreen";
  HomeCubit homeCubit = HomeCubit();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SearchItem(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 12),
                Expanded(
                  child: FutureBuilder(
                      future: ApiManager.getProduct(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return buildGridView(snapshot.data!);
                        } else if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        } else {
                          return const Center(child: CircularProgressIndicator());
                        }
                      }),
                ),
              ],
            ),
          ))
        ],
      ),
    )));
  }

  GridView buildGridView(List<Products> list) {
    return GridView.builder(
      itemCount: list.length, // Set the number of items to display
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Set the number of columns
        mainAxisSpacing: 8.0, // Set the spacing between rows
        crossAxisSpacing: 8.0, // Set the spacing between columns
        childAspectRatio: 0.75, // Set the aspect ratio of the grid items
      ),
      itemBuilder: (context, index) {
        return ItemProduct(products: list[index],);
      },
    );
  }
}
