import 'package:bloc_counter/productsdir/ApiReqeust/model/Product.dart';
import 'package:bloc_counter/productsdir/bloc_pattern/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child:
              BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
            if (state is InitialState) {
              productBloc.add(FetchAllProductsEvent());
            }
            if (state is LoadingState) {
              return loadingView(context);
            } else if (state is DataLoadedState) {
              List<Product> products = state.products;
              return ListView.builder(
                itemCount: products.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  Product eachProduct = products[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.white70,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.28),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(
                                1, 2), // changes the shadow position
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AspectRatio(
                            aspectRatio: .8,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              child: Image.network(
                                eachProduct.thumbnail,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    eachProduct.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Expanded(
                                    child: Text.rich(
                                      TextSpan(
                                        text: eachProduct.description,
                                      ),
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is ErrorState) {
              return Text(state.errorString);
            } else {
              return const Text("Wait");
            }
          }),
        ),
      ),
    );
  }
}

Widget loadingView(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.black.withOpacity(1),
    highlightColor: Colors.white.withOpacity(0.08),
    child: Row(
      children: [
        Expanded(
          // Expand the Column to fill available horizontal space
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                loadingItem(context),
                const SizedBox(height: 16),
                loadingItem(context),
                const SizedBox(height: 16),
                loadingItem(context),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget loadingItem(BuildContext context) {
  return Container(
    height: 120,
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.1),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    ),
  );
}
