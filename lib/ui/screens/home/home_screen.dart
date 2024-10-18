import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_for_route/ui/uitis/dialog.dart';
import '../../../cubit/home_cubit.dart';
import '../../../cubit/home_state.dart';
import '../../../model/products.dart';
import '../../widget/item_product.dart';
import '../../widget/search_item.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocProvider(
            create: (context) => HomeCubit()..getProduct(),
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (BuildContext context, HomeState state) {
                if (state is LoadingHome) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Loading...")),
                  );
                } else if (state is FailureHome) {
                  showErrorDialog(context, state.errMessage.toString());
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(content: Text(state.errMessage.toString())),
                  // );
                } else if (state is SuccessHome) {
                  print(state.products.reversed); // This will now print the list of products
                }
              },
              builder: (BuildContext context, HomeState state) {
                if (state is SuccessHome) {
                  return Column(
                    children: [
                      const SearchItem(),
                      const SizedBox(height: 12,),
                      Expanded(
                        child: buildGridView(state.products), // Pass the list of products
                      ),
                    ],
                  );
                } else {
                  // Handle other states (Loading, Failure, etc.)
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
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
        return ItemProduct(products: list[index]); // Pass the product to ItemProduct
      },
    );
  }
}
