import 'package:coding_cubit/response/res_get_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailScreen extends StatefulWidget {
  final Product? data;
  const DetailScreen(this.data, {super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.data?.title ?? "")),
      body: ListView.builder(
          itemCount: widget.data?.images?.length,
          itemBuilder: (context, index) {
            return Image.network(
              widget.data!.images![index],
            );
          }),
    );
  }
}
