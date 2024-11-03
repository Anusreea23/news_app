import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/controller/search_screen_controller.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final searchScreenProvider = context.watch<SearchScreenController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Here",
          style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SearchBar(
            backgroundColor: WidgetStatePropertyAll(Colors.purple),
            controller: controller,
            leading: IconButton(
                onPressed: () {
                  context
                      .read<SearchScreenController>()
                      .onSearch(controller.text);
                },
                icon: Icon(Icons.search)),
            onChanged: (value) {
              print(value);
            },
          ),
          Expanded(
            child: Builder(
              builder: (context) {
                if (searchScreenProvider.newsArticle.isEmpty) {
                  return Center(
                    child: Text("No result found"),
                  );
                } else {
                  return ListView.separated(
                    itemBuilder: (context, index) => Container(
                      child: ListTile(
                        title: Text(searchScreenProvider
                            .newsArticle[index].title
                            .toString()),
                        leading: CachedNetworkImage(
                          imageUrl: searchScreenProvider
                              .newsArticle[index].urlToImage
                              .toString(),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),

                        // leading: Image.network(searchScreenProvider
                        //     .newsArticle[index].urlToImage
                        //     .toString()),
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                    itemCount: searchScreenProvider.newsArticle.length,
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
