import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:coding_cubit/repository/repository_products.dart';
import 'package:coding_cubit/response/res_get_products.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());

  RepoProducts repoProducts = RepoProducts();
  ResGetProducts? resGetProducts;

  Future<void> getProductsCubit(BuildContext context) async {
    try {
      emit(GetProductsLoading());
      ResGetProducts? res = await repoProducts.getProducts();
      if (res?.products != []) {
        resGetProducts = res;
        log("${resGetProducts?.products}");
        emit(GetProductsSuccess());
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Gagal load data")));
        emit(GetProductsError());
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Gagal load data")));
      emit(GetProductsFailed());
    }
  }
}
