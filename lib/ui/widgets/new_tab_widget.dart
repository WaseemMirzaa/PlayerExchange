import 'package:flutter/material.dart';

class NewsTabWidget extends StatefulWidget {
  const NewsTabWidget({Key? key}) : super(key: key);

  @override
  _NewsTabWidgetState createState() => _NewsTabWidgetState();
}

class _NewsTabWidgetState extends State<NewsTabWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildBuilderDelegate((_,index){
      return getSingleItem('Jones continue to strugle', 'Espn');
    },
    childCount: 0
    ));


    //   ListView.builder(itemBuilder: (_,index){
    //   return getSingleItem('Jones continue to strugle', 'Espn');
    // },
    //   itemCount: 5,
    // );
  }

  getSingleItem(String title,String subtitle){
    return ListTile(
      title: Text(title,style: TextStyle(color: Colors.black),),
      subtitle: Text(subtitle,style: TextStyle(color: Colors.grey)),
    );
  }
}
