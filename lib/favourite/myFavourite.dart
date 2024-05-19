import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favourite_provider.dart';

class MyFav extends StatefulWidget {
  const MyFav({super.key});

  @override
  State<MyFav> createState() => _MyFavState();
}

class _MyFavState extends State<MyFav> {

  @override
  Widget build(BuildContext context) {
    final favPro = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favourite List"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child:ListView.builder(
                itemCount: favPro.isFav.length,
                itemBuilder: (context,index){
                  int itemIndex = favPro.isFav[index]; // Correctly getting the item index from the list
                  return Consumer<FavouriteProvider>(builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.isFav.contains(itemIndex)) {
                          value.removeItem(itemIndex);
                        } else {
                          value.addItem(itemIndex);
                        }
                        // Removed the unnecessary manual addition
                        // favPro.isFav.add(itemIndex); // This line is removed
                      },
                      title: Text("item $itemIndex"), // Changed index to itemIndex
                      trailing: Icon(value.isFav.contains(itemIndex) ? Icons.favorite : Icons.favorite_border_outlined),
                    );
                  });

                  // return Consumer<FavouriteProvider>(builder: (context,value,child){
                  //   return ListTile(
                  //     onTap: (){
                  //       if(value.isFav.contains(index)){
                  //         value.removeItem(index);
                  //       }else{
                  //         value.addItem(index);
                  //       }
                  //     },
                  //     title: Text("item $index"),
                  //     trailing: Icon(value.isFav.contains(index)? Icons.favorite:Icons.favorite_border_outlined),
                  //   );
                  // });

                },
            ),
          ),
        ],
      ),
    );
  }
}
