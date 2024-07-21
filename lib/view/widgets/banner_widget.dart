import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webandcrafts_project/view/utils/constants/mediaquery.dart';
import 'package:webandcrafts_project/view_model/product_view_model.dart';

class AdImage extends StatelessWidget {
  const AdImage({super.key});

  @override
  Widget build(BuildContext context) {
    return (Provider.of<ProductProvider>(context, listen: true)
            .bannerSinglesList
            .isEmpty)
        ? const CircularProgressIndicator()
        : Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: mediaqueryheight(0.09, context),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    Provider.of<ProductProvider>(context, listen: true)
                        .bannerSinglesList[0]
                        .imageUrl,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ));
  }
}
