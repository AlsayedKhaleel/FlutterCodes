import 'package:egrocery/features/models/fake_data.dart';
import 'package:egrocery/features/models/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BestDeal extends StatefulWidget {
  const BestDeal({super.key});

  @override
  State<BestDeal> createState() => _BestDealState();
}

class _BestDealState extends State<BestDeal> {
  List<ItemModel> items = fakeData.map((e) => ItemModel.fromJson(e)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: GridView.builder(
        padding: const EdgeInsets.all(20.0),
        // 1. Control the layout (columns, spacing)
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10.0, // Horizontal space between items
          mainAxisSpacing: 10.0, // Vertical space between items
          childAspectRatio: 1.0, // Aspect ratio (width / height) of each cell
        ),
        // 2. Specify total item count
        itemCount: items.length,
        // 3. Build each item dynamically
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              // color: Colors.grey,
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Stack(
                    children: [
                      Image.network(
                        items[index].images![0],
                        height: 90,
                        width: double.infinity,
                      ),
                      Positioned(
                        right: 10,
                        child: Icon(
                          CupertinoIcons.heart_solid,
                          color: Colors.green,
                        ),
                        // child: Icon(CupertinoIcons.heart, color: Colors.red),
                      ),
                    ],
                  ),
                ),
                Text(
                  items[index].title!,
                  style: TextStyle(fontSize: 20, fontWeight: .bold),
                ),
                Text(
                  items[index].volume!,
                  style: TextStyle(fontWeight: .bold, color: Colors.grey),
                ),

                Row(
                  children: [
                    Text(
                      "\$${items[index].price! - (items[index].price! * (items[index].discount! / 100))}",
                    ),
                    SizedBox(width: 10),
                    Text(
                      "\$${items[index].price!}",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.grey,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      width: 70,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
