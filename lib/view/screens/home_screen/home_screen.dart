import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:provider/provider.dart';
import 'package:webandcrafts_project/view/utils/constants/mediaquery.dart';
import 'package:webandcrafts_project/view/utils/constants/sized_box.dart';
import 'package:webandcrafts_project/view/widgets/category_widget.dart';
import 'package:webandcrafts_project/view/widgets/feutured_widget.dart';
import 'package:webandcrafts_project/view/widgets/home_appbar.dart';
import 'package:webandcrafts_project/view/widgets/mostpopular_widget.dart';
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
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     final productProvider =
  //         Provider.of<ProductProvider>(context, listen: false);
  //     productProvider.fetchProductDetails();
  //     if (productProvider.bannerSlidersList.isEmpty) {
  //       productProvider.fetchProductDetails();
  //     }
  //     log('called from didChangeDependencies');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.08, context)),
          child: const CustomHomeAppbar()),
      body: SingleChildScrollView(
        child: Column(children: [
          const CustomSizedBoxHeight(0.02),
          // SizedBox(
          //     height: mediaqueryheight(0.20, context),
          //     child: PageViewWithIndicator()),
          const MostPopularWidget(),
          (Provider.of<ProductProvider>(context, listen: true)
                  .bannerSinglesList
                  .isEmpty)
              ? const CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: mediaqueryheight(0.09, context),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(Provider.of<ProductProvider>(
                                    context,
                                    listen: true)
                                .bannerSinglesList[0]
                                .imageUrl),
                            fit: BoxFit.fill)),
                  ),
                ),
          const CategoryWidget(),
          const CustomSizedBoxHeight(0.02),
          const FeuturedWIdget(),
        ]),
      ),
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Home",
        useSafeArea: true,
        labels: const ["Home", "Dashboard", "Profile", "Settings"],
        icons: const [
          Icons.dashboard,
          Icons.home,
          Icons.people_alt,
          Icons.settings
        ],
      ),
    );
  }
}
