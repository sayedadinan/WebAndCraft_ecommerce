import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:provider/provider.dart';
import 'package:webandcrafts_project/view/utils/constants/mediaquery.dart';
import 'package:webandcrafts_project/view/widgets/home_appbar.dart';

import 'package:webandcrafts_project/view_model/product_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<ProductProvider>(context, listen: false)
        .fetchProductDetails());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.08, context)),
          child: const CustomHomeAppbar()),
      body: Consumer<ProductProvider>(
        builder: (context, viewModel, child) {
          return ListView.builder(
            itemCount: viewModel.dynamicWidgets.length,
            itemBuilder: (context, index) {
              return viewModel.dynamicWidgets[index];
            },
          );
        },
      ),
    );
  }
}
