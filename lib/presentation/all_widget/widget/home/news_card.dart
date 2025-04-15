import 'package:betting_app/data/models/article.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final List<Article> articles;

  const NewsCard({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        child: ListView.separated(
            itemCount: articles.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(),
            itemBuilder: (context, index) {
              final article = articles[index];
              return _buildNewsCard(context, article);
            }),
      );
    });
  }

  Widget _buildNewsCard(BuildContext context, Article article) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: Card(
        color: Colors.transparent,
        elevation: 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Stack(children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(article.urlToImage),
                          fit: BoxFit.cover)),
                );
              },
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AspectRatio(
                  aspectRatio: 6 / 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(230, 23, 23, 23),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              article.title,
                              textAlign: TextAlign.start,
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.visible,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            child: ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) =>
                                      _buildNewsModal(context, article),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                padding: const EdgeInsets.all(10),
                              ),
                              child: const Text('Read'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ]),
        ),
      ),
    );
  }

  //Widget per leggere le notizie
  Widget _buildNewsModal(BuildContext context, Article article) {
    return SafeArea(
      bottom: false,
      top: true,
      child: DraggableScrollableSheet(
        initialChildSize: 0.85,
        maxChildSize: 0.95,
        minChildSize: 0.65,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image(image: NetworkImage(article.urlToImage))),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    article.description,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
