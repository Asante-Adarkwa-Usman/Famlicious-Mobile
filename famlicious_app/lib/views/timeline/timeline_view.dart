import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class TimelineView extends StatelessWidget {
  const TimelineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Timeline'),
        actions: [
          IconButton(
            onPressed: null,
            icon: const Icon(UniconsLine.plus_square),
            color: Theme.of(context).iconTheme.color,
          )
        ],
      ),
      body: ListView(
        children: [
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80'),
                    ),
                    title: Text(
                      'Asante Usman',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      '1 minute ago',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                    trailing: IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.more_horiz,
                          color: Theme.of(context).iconTheme.color,
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'I am too happy jljkjofjosijfiojjoijoijijoijijoijoijoijoiijiojiojiojoijj'),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: null,
                              icon: Icon(
                                UniconsLine.thumbs_up,
                                color: Theme.of(context).iconTheme.color,
                              )),
                          IconButton(
                              onPressed: null,
                              icon: Icon(
                                UniconsLine.comment_lines,
                                color: Theme.of(context).iconTheme.color,
                              )),
                        ],
                      ),
                      IconButton(
                          onPressed: null,
                          icon: Icon(
                            UniconsLine.telegram_alt,
                            color: Theme.of(context).iconTheme.color,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
