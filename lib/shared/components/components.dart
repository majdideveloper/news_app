import 'package:flutter/material.dart';


Widget buildArticleItem (article,context ) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(
                    '${article['urlToImage']}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style:Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    Widget articleBuilder (list ) =>list.length>0
            ? ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildArticleItem(list[index],context),
                separatorBuilder: (context, index) => Container(
                      height: 1.0,
                      color: Colors.black,
                    ),
                itemCount: 10)
            : Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
    