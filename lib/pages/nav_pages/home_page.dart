import 'package:flutter/material.dart';
import 'package:fair_travel/widgets/app_large_text.dart';
import 'package:fair_travel/widgets/app_text.dart';
import 'package:fair_travel/widgets/themes.dart';

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

    // Preload images after the first frame is rendered
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Menu Bar
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
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

          // Tab Content with isolated widget
          SizedBox(
            height: 300,
            child: TabBarView(
              controller: _tabController,
              children: const [
                RepaintBoundary(child: ImageList()),
                Center(child: Text("There")),
                Center(child: Text("Bye")),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Explore More Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppLargeText(text: "Explore More", size: 22),
                AppText(text: "See all", color: AppColors.textColor1),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Explore More List
          SizedBox(
            height: 120,
            child: RepaintBoundary(child: ExploreMoreList(images: images)),
          ),
        ],
      ),
    );
  }
}

// ImageList Widget
class ImageList extends StatelessWidget {
  const ImageList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      padding: const EdgeInsets.only(left: 20),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(right: 15),
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage("assets/images/${index + 1}.png"),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

//  ExploreMoreList Widget
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

//  Custom Circle Tab Indicator
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
