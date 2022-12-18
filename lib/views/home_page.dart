import 'package:coding_cubit/views/detail_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit/get_products_cubit.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetProductsCubit(),
      child: BlocBuilder<GetProductsCubit, GetProductsState>(
        builder: (context, state) {
          GetProductsCubit? getProductsCubit = context.read<GetProductsCubit>();
          if (state is GetProductsInitial) {
            getProductsCubit.getProductsCubit(context);
          }
          return Scaffold(
            appBar: AppBar(title: Text("Homepage")),
            body: state is GetProductsInitial || state is GetProductsLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount:
                        getProductsCubit.resGetProducts?.products?.length,
                    itemBuilder: (context, index) {
                      var data =
                          getProductsCubit.resGetProducts?.products?[index];
                      return Card(
                        child: ListTile(
                          leading: Image.network(
                            data?.thumbnail ?? "",
                            width: 100,
                          ),
                          title: Text("Nama produk : ${data?.title}  "),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(index.toString()),
                              Text(
                                data?.description ?? "",
                                maxLines: 1,
                              ),
                              Text("Harga: ${data?.price} Dollar")
                            ],
                          ),
                          trailing: Column(
                            children: [
                              Text("Stok: ${data?.stock}"),
                              Text("Rating: ${data?.rating}/5"),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DetailScreen(data)));
                          },
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
