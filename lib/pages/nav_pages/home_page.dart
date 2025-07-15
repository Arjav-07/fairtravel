import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fair_travel/cubit/app_cubit.dart';
import 'package:fair_travel/cubit/app_cubit_state.dart';
import 'package:fair_travel/widgets/app_large_text.dart';
import 'package:fair_travel/widgets/app_text.dart';
import 'package:fair_travel/widgets/themes.dart';
import 'package:fair_travel/widgets/app_drawer.dart';

// Padding shortcut
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
    "mountain.jpg": "Hiking",
    "raft.jpg": "Kayaking",
    "scuba.jpg": "Snorkeling",
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var image in images.keys) {
        precacheImage(AssetImage("assets/images/$image"), context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            final info = state.places;

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top bar
                  Padding(
                    padding: const EdgeInsets.only(top: 60).add(kSidePadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(
                          builder: (context) => GestureDetector(
                            onTap: () => Scaffold.of(context).openDrawer(),
                            child: const Icon(
                              Icons.menu,
                              size: 30,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Padding(
                    padding: kSidePadding,
                    child: AppLargeText(text: "Discover", size: 32),
                  ),

                  const SizedBox(height: 20),

                  /*--------------------TAB BAR -------------------- */
                  Padding(
                    padding: kSidePadding,
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 3,
                        ),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        isScrollable: false,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black,
                        labelStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                        unselectedLabelStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        tabs: const [
                          Tab(text: "Places"),
                          Tab(text: "Inspirational"),
                          Tab(text: "Emotions"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // TabBarView
                  SizedBox(
                    height: 280,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        PlaceList(info: info),
                        const Center(child: Text("Inspirational")),
                        const Center(child: Text("Emotions")),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

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

                  const SizedBox(height: 15),

                  SizedBox(height: 120, child: ExploreList(images: images)),

                  const SizedBox(height: 30),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

/*--------------------IMG CARDS -------------------- */
class PlaceList extends StatelessWidget {
  final List<dynamic> info;

  const PlaceList({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 20),
      itemCount: info.length,
      itemBuilder: (context, index) {
        final place = info[index];

        return GestureDetector(
          onTap: () {
            BlocProvider.of<AppCubits>(context).detailPage(place);
          },
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            width: 220,
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(place.img),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 28,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            place.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis,
                              shadows: [
                                Shadow(
                                  blurRadius: 3,
                                  color: Colors.black38,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            place.location,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              shadows: [
                                Shadow(
                                  blurRadius: 2,
                                  color: Colors.black26,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ExploreList extends StatelessWidget {
  final Map<String, String> images;

  const ExploreList({super.key, required this.images});

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
          margin: const EdgeInsets.only(right: 20),
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
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
  void paint(Canvas canvas, Offset offset, ImageConfiguration config) {
    final Paint paint = Paint()
      ..color = color
      ..isAntiAlias = true;

    final double dx = offset.dx + config.size!.width / 2;
    final double dy = offset.dy + config.size!.height - radius;

    canvas.drawCircle(Offset(dx, dy), radius, paint);
  }
}
