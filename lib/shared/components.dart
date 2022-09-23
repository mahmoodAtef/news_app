import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view.dart';

Widget articleBuilder(article , context )
{
  return InkWell(
    onTap: (){Navigator.pop(context , WebViewScreen(article['url']));},
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Card(
          elevation: 20,
            semanticContainer: false,
            color: Colors.grey[100],
            child: Stack(
              children: [
                   Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                            image: NetworkImage(
                          '${article['urlToImage'].toString()}',
                        ))),
                    height: 250,
                  ),

                Column(
                  children: [
                     SizedBox(height: 150),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
                        color: Colors.black.withOpacity(.4),
                      ),
                      height: 100,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              article['title'].toString(),
                              textDirection: TextDirection.rtl,style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(
                                height: 3,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  Icons.watch_later_outlined,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 3,
                                ),

                                     Text(
                                  article['publishedAt'].toString(),
                                  style: TextStyle(
                                    color: Colors.white,

                                  ),
                                      overflow: TextOverflow.ellipsis,
                                ),



                                     Text(
                                      article['source']['name'].toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),

                                      overflow: TextOverflow.ellipsis,
                                    ),
                                SizedBox(
                                  width: 3,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
      ),
    ),
  );
}