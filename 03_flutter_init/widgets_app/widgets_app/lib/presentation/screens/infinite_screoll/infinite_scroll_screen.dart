import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfititeScroll extends StatefulWidget {
  static const name = 'infinite_screen';
  const InfititeScroll({super.key});

  @override
  State<InfititeScroll> createState() => _InfititeScrollState();
}

class _InfititeScrollState extends State<InfititeScroll> {
  List<int> imagesIDs = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 1));
    addFiveImages();
    isLoading = false;
    if (!isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  Future<void> onRefresh() async {
    isLoading = true;

    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;
    isLoading = false;
    final lastID = imagesIDs.last;
    imagesIDs.clear();
    imagesIDs.add(lastID + 1);
    addFiveImages();
    setState(() {});
  }

  void addFiveImages() {
    final lastID = imagesIDs.last;
    imagesIDs.addAll([1, 2, 3, 4, 5].map((e) => lastID + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIDs.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                placeholder: const AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/id/${imagesIDs[index]}/500/300'),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        //child: const Icon(Icons.arrow_back),
        child: (!isLoading)
            ? FadeIn(child: const Icon(Icons.arrow_back))
            : SpinPerfect(
                infinite: true,
                child: const Icon(Icons.refresh_outlined),
              ),
      ),
    );
  }
}
