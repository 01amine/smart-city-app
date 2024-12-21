
import 'package:bsc/features/home/presentation/bloc/home_bloc.dart';
import 'package:bsc/features/home/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:google_fonts/google_fonts.dart';
import 'details_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _searchCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Reusable Text Style
    final headerTextStyle = GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      body: BlocProvider(
        create: (_) => HomeBloc()..add(LoadDataEvent()), // Initialize BLoC and load data
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is HomeError) {
              return Center(child: Text(state.message));
            } else if (state is HomeLoaded) {
              final pourVousData = state.pourVousData;
              final destinationsTendanceData = state.destinationsTendanceData;
              final offresSpecialesData = state.offresSpecialesData;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyAppBar(searchCon: _searchCon),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 30, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // "Pour vous" section
                          _buildSection(
                            headerTextStyle,
                            "Pour vous",
                            pourVousData,
                            context,
                          ),
                          SizedBox(height: 30),

                          // "Destinations Tendance" section
                          _buildSection(
                            headerTextStyle,
                            "Destinations Tendance",
                            destinationsTendanceData,
                            context,
                          ),
                          SizedBox(height: 30),

                          // "Offres Spéciales" section
                          _buildOffersSection(headerTextStyle, offresSpecialesData),
                          SizedBox(height: 30),

                          // Additional Section Example
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Découvrez nos destinations",
                              style: headerTextStyle,
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildSection(
    TextStyle headerTextStyle,
    String header,
    List<Map<String, String>> data,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(header, style: headerTextStyle),
            TextButton(
              onPressed: () {},
              child: Text(
                "Voir Plus >",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(imagePath: data[index]['image']!),
                    ),
                  );
                },
                child: _buildHotelCard(data[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHotelCard(Map<String, String> data) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              data['image']!,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "DZD 2900",
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            data['name']!,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 10),
          RatingStars(
            value: 4,
            starCount: 5,
            starSize: 15,
            maxValue: 5,
            starSpacing: 2,
            valueLabelVisibility: false,
            starOffColor: const Color(0xffe7e8ea),
            starColor: Colors.yellow,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.map, size: 16, color: Colors.grey),
              const SizedBox(width: 5),
              Text(
                data['location']!,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOffersSection(
    TextStyle headerTextStyle,
    List<Map<String, String>> data,
  ) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  data[index]['image']!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
