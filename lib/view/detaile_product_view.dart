import 'package:ecomerceflutter/constant.dart';
import 'package:ecomerceflutter/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
class DetaileProductView extends StatelessWidget {
  var model;

  DetaileProductView({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText(alignments: Alignment.topLeft, text: "Squid Game",size: 19.9,color: greycolor,),
        elevation: 0,
        actions: [ Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(Icons.videogame_asset,color:primerycolor,),
        )],
      ),
      body: Container(padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(child: Image.network(model?.image , height: MediaQuery.of(context).size.height - 400,fit:BoxFit.cover,width: double.infinity,)),
            Container(margin: EdgeInsets.only(top: 10), child: CustomText(text:model?.description,color: secondrycolor, size: 15,)),
          ],
        ),
      ),
    );
  }
}
