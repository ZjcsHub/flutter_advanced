import 'package:flutter/material.dart';
import '../Servers/ScreenAdaper.dart';
import '../model/categoryModel.dart';
class Category extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoryState();
  }
}

class _CategoryState extends State {

  int _seleteIndex = 0;

  List<CategoryModel> cateModelLists = [];

  @override
  void initState() {

    var itemDict = [
      {
        "title":"家用电器",
        "itemLists":[
          {"title":"SIEMENS","imageUrl":"https://img14.360buyimg.com/vclist/s166x70_jfs/t1/90641/24/3606/1171/5de0e340Eaad1e3e0/5b9cad64436c05ff.jpg","productUrl":"https://pro.jd.com/mall/active/3BPQ3jZhu2VtDQA83UHDSVpbkQbK/index.html"},
          {"title":"Letv","imageUrl":"https://img13.360buyimg.com/vclist/s166x70_jfs/t1/139430/40/24916/4442/61c9306fE31c9f3c2/1512a1c385847911.jpg","productUrl":"https://pro.jd.com/mall/active/2uGNsSm1NaEuri7y5g4ocYHTz4qW/index.html"},
          {"title":"TCL","imageUrl":"https://img11.360buyimg.com/vclist/s166x70_jfs/t1/212165/32/9215/5036/61c92fd2Ea86f0a30/6a78e8a4c3120b79.jpg","productUrl":"https://pro.jd.com/mall/active/37p9Nq85eQmMgaGhD2nM5uPqNixM/index.html?babelChannel=ttt37"},
          {"title":"Haier","imageUrl":"https://img11.360buyimg.com/vclist/s166x70_jfs/t3211/96/3882705424/5364/76e60d4a/57f9fa89N6ddb14fc.jpg","productUrl":"https://pro.jd.com/mall/active/x4jSkhDjgv6YzZnwZWo4rBNDTRx/index.html"},
          {"title":"格力","imageUrl":"https://img13.360buyimg.com/vclist/s166x70_jfs/t2587/271/1840897889/3013/d15dee81/574c0755Nc8f19944.jpg","productUrl":"https://mall.jd.com/index-1000003445.html"},
          {"title":"海信","imageUrl":"https://img13.360buyimg.com/vclist/s166x70_jfs/t1/137612/20/16799/13456/5fc8514aEdf8dc1d2/3934e33362f22489.jpg","productUrl":"https://pro.jd.com/mall/active/4ShPRvH8fJd3FhXsm1QPR69SAjHE/index.html"},
          {"title":"科沃斯","imageUrl":"https://img12.360buyimg.com/vclist/s166x70_jfs/t1/20167/31/8667/2542/5c7899aeE5a38be51/890312111d77e347.jpg","productUrl":"https://mall.jd.com/index-1000002989.html"},
        ]
      },
      {"title":"手机数码","itemLists":[
        {"title":"苹果","imageUrl":"https://img13.360buyimg.com/vclist/s166x70_jfs/t14128/305/889686186/2374/1614f087/5a1669f5N5f386fbb.jpg","productUrl":"https://mall.jd.com/index-1000000127.html"},
        {"title":"漫步者","imageUrl":"https://img12.360buyimg.com/vclist/s166x70_jfs/t1/161269/37/16618/8145/606c31deE0d2e0f53/72aabbecfd22d604.jpg","productUrl":"https://mall.jd.com/index-1000000187.html"},
        {"title":"小米","imageUrl":"https://img14.360buyimg.com/vclist/s166x70_jfs/t1/153085/13/5130/2055/5fa8b002E315a7c6c/e64f2c27bdd413ff.png","productUrl":"https://mall.jd.com/index-1000004123.html"},
        {"title":"TP-link","imageUrl":"https://img13.360buyimg.com/vclist/s166x70_jfs/t15505/173/2529157702/5299/b3754233/5aaf1cf6Nf7edd926.jpg","productUrl":"https://mall.jd.com/index-1000000754.html"},
        {"title":"华为","imageUrl":"https://img20.360buyimg.com/vclist/s166x70_jfs/t1/106454/21/11503/4295/5e36de1dEf03498af/7485022bae41f19b.jpg","productUrl":"https://mall.jd.com/index-1000004259.html"},
        {"title":"大疆创新","imageUrl":"https://img14.360buyimg.com/vclist/s166x70_jfs/t1/156965/27/11869/4107/603da99aE3a068be4/1439c3c3819381d6.jpg","productUrl":"https://mall.jd.com/index-1000002350.html"},

      ]},

    ];

    for (var dict in itemDict) {
      cateModelLists.add(CategoryModel.formJson(dict));
    }



  }

  Widget _LeftItem() {
    return ListView.builder(itemBuilder: (context,index){

      return Column(
        children: [
          InkWell(
            onTap: (){
              setState(() {
                _seleteIndex = index;
              });
            },
            child: Container(
                child: Text(cateModelLists[index].title,textAlign: TextAlign.center,style: TextStyle(
                  color: _seleteIndex == index ? Colors.red:Colors.black
                ),),
                width: double.infinity,
              padding: EdgeInsets.only(top: 20,bottom: 20),
              color: _seleteIndex == index ? Colors.black12 : Colors.white,
            ),

          ),
          Divider(
            height: 1,
          )
        ],
      );

    },
      itemCount: cateModelLists.length,
    );
    
  }
  Widget _smallCategoryItem(CategoryItemsModel itemsModel) {
    return GestureDetector(
      onTap: (){
        print(itemsModel.title);
        // Navigator.pushNamed(context, "products",arguments: itemsModel);
        Navigator.pushNamed(context, "tabbar");
      },
      child: Container(
        child: Column(
          children: [

            AspectRatio(
              aspectRatio: 1/0.4,
              child: Image.network(itemsModel.imageUrl,fit: BoxFit.cover,),
            ),
            Container(
              child: Text(
                itemsModel.title,
                maxLines: 2,
              ),
              // height: 28,
            )
          ],

        ),
      ),
    );
  }

  _RightContext() {

    var itemLists = cateModelLists[_seleteIndex].itemLists;
    
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        childAspectRatio: 1/0.6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10
      ),
      itemBuilder: (context,index){

        return _smallCategoryItem(itemLists[index]);
      },
    itemCount: itemLists.length,
      padding: EdgeInsets.all(10),
    );

  }

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Container(
          child: _LeftItem(),
          height: double.infinity,
          width: 140,
        ),
        Expanded(
          child:Container(
            child: _RightContext(),
            height: double.infinity,


          ),
          flex: 1,
        )

      ],
    );

  }
}
