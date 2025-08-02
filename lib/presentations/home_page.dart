import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:slicing_design/helper/size_customize.dart';
import 'package:slicing_design/model/category.dart';
import 'package:slicing_design/model/product.dart';
import 'package:slicing_design/style/custom_text.dart';
import 'package:slicing_design/widgets/custom_button.dart';
import 'package:slicing_design/widgets/custom_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategoryIndex = 0; // Variable to store selected category
  TextEditingController search = TextEditingController();
  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var formatAmount = NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$',
      decimalDigits: 2,
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeCustomize.setSp(24),
              vertical: SizeCustomize.setSp(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBar(),
                SizeCustomize.spaceArea(18),
                textFieldSearch(),
                SizeCustomize.spaceArea(18),
                listCategory(),
                SizeCustomize.spaceArea(18),
                gridView(formatAmount),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row appBar() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubText(text: "Hello, Welcome 👋"),
              TitleText(text: 'Albert Stevano'),
            ],
          ),
        ),
        CircleAvatar(backgroundImage: AssetImage('assets/images/profile.png')),
      ],
    );
  }

  Row textFieldSearch() {
    return Row(
      children: [
        Expanded(
          child: CustomizeTextField(
            textController: search,
            prefixWidget: Padding(
              padding: EdgeInsets.only(left: 10, right: SizeCustomize.setSp(8)),
              child: Icon(Icons.search),
            ),
            hintText: "Search...",
            border: BorderSide(width: 0.4, color: Colors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CustomizeButton(
            function: () {},
            widget: Icon(Icons.menu, size: 45, color: Colors.white),
            backgroundColor: Colors.black,
          ),
        ),
      ],
    );
  }

  SizedBox listCategory() {
    return SizedBox(
      height: 20,
      child: ListView.builder(
        itemCount:
            categories.length + 1, // Tambahkan 1 untuk kategori "All Items"
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // Index 0 adalah kategori "All Items"
          final category = index == 0 ? null : categories[index - 1];
          bool isSelected = _selectedCategoryIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategoryIndex = index; // Update kategori yang dipilih
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeCustomize.setSp(16),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.transparent,
                border: Border.all(width: 0.2),
              ),
              child: Align(
                child: SubText(
                  text: category == null ? "All Items" : category.name,
                  colors: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  MasonryGridView gridView(NumberFormat formatAmount) {
    return MasonryGridView.builder(
      itemCount: products.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      mainAxisSpacing: 24,
      crossAxisSpacing: 17,
      itemBuilder: (context, index) {
        final data = products[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: SizeCustomize.borderRadiusCircular(all: 20),
              child: Stack(
                children: [
                  Image.asset(data.image),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: CircleAvatar(
                      radius: 15,
                      child: CustomizeButton(
                        function: () {
                          setState(() {
                            data.favorite = !data.favorite;
                          });
                        },
                        shape: CircleBorder(),
                        backgroundColor: Colors.black,
                        widget: Icon(
                          data.favorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TitleText(text: data.name, size: 15),
            SubText(text: data.type.name, colors: Colors.grey),
            Row(
              children: [
                Expanded(
                  child: SubText(
                    text: formatAmount.format(data.amount),
                    weight: FontWeight.w500,
                  ),
                ),
                Icon(Icons.star, color: Colors.yellow.shade600),
                SubText(text: "${data.rating}"),
              ],
            ),
          ],
        );
      },
    );
  }
}
