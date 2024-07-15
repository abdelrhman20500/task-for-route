import 'package:flutter/material.dart';
import 'package:task_for_route/model/products.dart';
class ItemProduct extends StatelessWidget {
  ItemProduct({super.key,required this.products});
 Products products;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.36,
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(width: 1, color: Colors.blue),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(products.images![0],
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 126, top: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 3), // adjust the offset to change the shadow position
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: InkWell(
                          onTap: (){},
                          child: const Icon(Icons.favorite_border_sharp, color: Colors.blue,),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 4),
            Text(products.description!,
              maxLines: 1,overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 20),),
            const SizedBox(height: 4,),
            Expanded(
              child: Row(
                children: [
                  Text("EGP ${products.discountPercentage!}", style: const TextStyle(fontSize: 16),),
                  const SizedBox(width: 12,),
                  Text("${products.price} EGP", style: const TextStyle(fontSize: 12,color: Colors.blue,
                  decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.blue,
                    decorationThickness: 3,),),
                ],
              ),
            ),
             Expanded(
              child: Row(
                children: [
                  const Text("Review", style: TextStyle(fontSize: 16)),
                  Text("(${products.rating!})".toString(), style: const TextStyle(fontSize: 16)),
                  const Icon(Icons.star, size: 22, color: Colors.yellow,),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.add, size: 18, color: Colors.white,),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
