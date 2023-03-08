import 'package:flutter/material.dart';
import 'package:food_app/controllers/cart_controller.dart';
import 'package:food_app/pages/cart/cart.dart';
import 'package:food_app/pages/cart/wish_items_cart.dart';
import 'package:food_app/pages/home/main_food_page.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/cart_widget.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;

  List pages = [
    MainFoodPage(),
    WishCart(),
    CartPage(),
    Container(child: Center(child: Text("About me")),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only( topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.only(topRight:  Radius.circular(30), topLeft: Radius.circular(30)),
            child: BottomNavigationBar(
              backgroundColor: AppColors.mainColor,
              selectedLabelStyle: TextStyle(color: Colors.white),
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              currentIndex: _selectedIndex,
              useLegacyColorScheme: false,

              onTap: onTapNav,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined, color: Colors.white,),
                  label: "Home"
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.folder, color: Colors.white,),
                  label: "orders"
                ),
                BottomNavigationBarItem(
                    icon: GetBuilder<CartController>(
                        builder: (controller) => CartWidget(
                          controller: controller,
                          backgroundColor: Colors.transparent,
                          iconColor: Colors.white,
                          hoverSize: 14,
                          size: 24,
                          iconSize: 24,
                        )
                    ),
                    label: "Cart"
                  ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person, color: Colors.white,),
                    label: "Me"
                ),

                ],
            ),
        ),
      ),
    );
  }

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
