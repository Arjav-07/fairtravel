import 'package:fair_travel/cubit/app_cubit.dart';
import 'package:fair_travel/cubit/app_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:fair_travel/widgets/app_large_text.dart';
import 'package:fair_travel/widgets/app_text.dart';
import 'package:fair_travel/widgets/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Constant padding
const EdgeInsets kSidePadding = EdgeInsets.symmetric(horizontal: 20);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  final Map<String, String> images = {
    "ballon.jpg": "Ballooning",
    "hiking.jpg": "Hiking",
    "kayking.jpg": "Kayaking",
    "snorkling.jpg": "Snorkeling",
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var i = 1; i <= 4; i++) {
        precacheImage(AssetImage("assets/images/$i.png"), context);
      }
      for (var image in images.keys) {
        precacheImage(AssetImage("assets/images/$image"), context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Menu Bar
                Padding(
                  padding: const EdgeInsets.only(top: 70).add(kSidePadding),
                  child: Row(
                    children: [
                      const Icon(Icons.menu, size: 30, color: Colors.black54),
                      const Spacer(),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: AppLargeText(text: "Discover"),
                ),

                const SizedBox(height: 20),

                // Tab Bar
                Material(
                  color: Colors.transparent,
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    indicator: const CircleTabIndicator(
                      color: AppColors.mainColor,
                      radius: 4,
                    ),
                    tabs: const [
                      Tab(text: "Places"),
                      Tab(text: "Inspirational"),
                      Tab(text: "Emotions"),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Tab Content
                SizedBox(
                  height: 300,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      RepaintBoundary(child: ImageList(info: info)),
                      const Center(child: Text("There")),
                      const Center(child: Text("Bye")),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Explore More
                const Padding(
                  padding: kSidePadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(text: "Explore More", size: 22),
                      AppText(text: "See all", color: AppColors.textColor1),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  height: 120,
                  child: RepaintBoundary(
                    child: ExploreMoreList(images: images),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

// ---------- IMAGE LIST ----------

class ImageList extends StatelessWidget {
  final List<dynamic> info; // Use your actual model type if defined

  const ImageList({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: info.length,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 20),
      itemBuilder: (context, index) {
        final String imageUrl = info[index].img.startsWith('http')
            ? info[index].img
            : "https://api.jsonbin.io/v3/b/687290ab6063391d31ac42dc${info[index].img}";

        return Container(
          margin: const EdgeInsets.only(right: 15),
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

// ---------- EXPLORE MORE ----------

class ExploreMoreList extends StatelessWidget {
  final Map<String, String> images;
  const ExploreMoreList({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 20),
      itemCount: images.length,
      itemBuilder: (_, index) {
        final imageName = images.keys.elementAt(index);
        final label = images.values.elementAt(index);

        return Container(
          margin: const EdgeInsets.only(right: 30),
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage("assets/images/$imageName"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              AppText(text: label, color: AppColors.textColor2),
            ],
          ),
        );
      },
    );
  }
}

// ---------- CUSTOM TAB INDICATOR ----------

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..color = color
      ..isAntiAlias = true;

    final double dx = offset.dx + configuration.size!.width / 2;
    final double dy = offset.dy + configuration.size!.height - radius;

    canvas.drawCircle(Offset(dx, dy), radius, paint);
  }
}
