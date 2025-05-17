import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class StockNewsPage extends StatefulWidget {
  const StockNewsPage({super.key});

  @override
  State<StockNewsPage> createState() => _StockNewsPageState();
}

class _StockNewsPageState extends State<StockNewsPage> {
  final List<String> categories = [
    "All",
    "Stocks",
    "Crypto",
    "Commodities",
    "Forex",
  ];
  String selectedCategory = "All";

  final List<Map<String, String>> newsItems = List.generate(
    6,
    (index) => {
      "region": "Europe",
      "title":
          "Ukraine's President Zelensky to BBC: Blood money being paid Ukraine's President Zelensky to BBC: Blood money being paid",
      "source": "BBC News",
      "time": "14m ago",
      "image":
          "https://th.bing.com/th/id/OIP.MLOFSCuoQ10MMO3EqYXdvQHaEK?rs=1&pid=ImgDetMain",
      "logo":
          "https://cdn2.vectorstock.com/i/1000x1000/48/26/bbc-news-logo-with-red-background-vector-42974826.jpg",
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Stocks Market News"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryBlue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonText(
                "Market News",
                context: context,
                size: 16,
                isBold: true,
                color: Colors.white,
              ),
              const SizedBox(height: 12),

              // Category tabs
              SizedBox(
                height: 30,

                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = category == selectedCategory;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      child: Container(
                        constraints: const BoxConstraints(minWidth: 60),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? Colors.transparent
                                  : AppColors.primaryBlueLight,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color:
                                isSelected
                                    ? AppColors.whiteColour
                                    : Colors.transparent,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: commonText(
                            category,
                            context: context,
                            size: 14,
                            color: isSelected ? Colors.white : Colors.white70,
                            isBold: isSelected,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),

              // News list
              Expanded(
                child: ListView.separated(
                  itemCount: newsItems.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = newsItems[index];
                    return _buildNewsCard(
                      context,
                      region: item["region"]!,
                      title: item["title"]!,
                      source: item["source"]!,
                      time: item["time"]!,
                      imagePath: item["image"]!,
                      logoPath: item["logo"]!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewsCard(
    BuildContext context, {
    required String region,
    required String title,
    required String source,
    required String time,
    required String imagePath,
    required String logoPath,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primaryBlueLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // News image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imagePath,
              width: 75,
              height: 75,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),

          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText(
                  region,
                  context: context,
                  size: 12,
                  color: Colors.white70,
                ),
                const SizedBox(height: 4),
                commonText(
                  title,
                  context: context,
                  size: 14,
                  isBold: true,
                  color: Colors.white,
                  maxline: 2,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        logoPath,
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 4),
                    commonText(
                      source,
                      context: context,
                      size: 14,
                      color: Colors.white70,
                    ),
                    const Spacer(),
                    Icon(Icons.access_time, color: Colors.white70, size: 16),
                    const SizedBox(width: 4),
                    commonText(
                      time,
                      context: context,
                      size: 12,
                      color: Colors.white70,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
