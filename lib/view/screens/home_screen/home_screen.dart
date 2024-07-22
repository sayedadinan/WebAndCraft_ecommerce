import 'package:flutter/material.dart';
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

  Future<void> _refreshData() async {
    await Provider.of<ProductProvider>(context, listen: false)
        .fetchProductDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, mediaqueryheight(0.08, context)),
        child: const CustomHomeAppbar(),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, viewModel, child) {
          return RefreshIndicator(
            onRefresh: _refreshData,
            child: viewModel.dynamicWidgets.isNotEmpty
                ? ListView.builder(
                    itemCount: viewModel.dynamicWidgets.length,
                    itemBuilder: (context, index) {
                      return viewModel.dynamicWidgets[index];
                    },
                  )
                : ListView(
                    children: const [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'No data available. Please refresh the screen.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
