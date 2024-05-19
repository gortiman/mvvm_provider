import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favourite_provider.dart';
import 'myFavourite.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favPro = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite List"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyFav()));
          }, icon: Icon(Icons.favorite)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return Consumer<FavouriteProvider>(builder: (context, value, child) {
                  return ListTile(
                    onTap: () {
                      if (value.isFav.contains(index)) {
                        value.removeItem(index);
                      } else {
                        value.addItem(index);
                      }
                      // Removed the unnecessary manual addition
                      // favPro.isFav.add(index); // This line is removed
                    },
                    title: Text("item $index"),
                    trailing: Icon(value.isFav.contains(index) ? Icons.favorite : Icons.favorite_border_outlined),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'favourite_provider.dart';
// import 'myFavourite.dart';
//
// class FavouriteScreen extends StatefulWidget {
//   const FavouriteScreen({super.key});
//
//   @override
//   State<FavouriteScreen> createState() => _FavouriteScreenState();
// }
//
// class _FavouriteScreenState extends State<FavouriteScreen> {
//   List<int> isSelected = [];
//   @override
//   Widget build(BuildContext context) {
//     final favPro = Provider.of<FavouriteProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Favourite List"),
//         centerTitle: true,
//         actions: [
//           IconButton(onPressed: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFav()));
//           }, icon: Icon(Icons.favorite)),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//               child:ListView.builder(
//                 itemCount: 50,
//                   itemBuilder: (context,index){
//                 return Consumer<FavouriteProvider>(builder: (context,value,child){
//                   return ListTile(
//                     onTap: (){
//                       if(value.isFav.contains(index)){
//                         value.removeItem(index);
//                       }else{
//                         value.addItem(index);
//                       }
//                     },
//                     title: Text("item $index"),
//                     trailing: Icon(value.isFav.contains(index)? Icons.favorite :Icons.favorite_border_outlined),
//                   );
//                 });
//
//               }),
//           ),
//         ],
//       ),
//     );
//   }
// }
