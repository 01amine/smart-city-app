import 'package:bsc/features/booking/presentation/booking_scree.dart';
import 'package:bsc/features/home/presentation/widgets/calander.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatelessWidget {
  final String imagePath;
  final String hotelName;
  final String hotelDescription;
  final String hotelLocation;
  final double rating;
  final double pricePerNight;
  final List<String> imagePaths;
  final List<String> servicesImages;
  final List<String> roomTypes;
  final List<String> roomPrices;
  final String localizationImagePath;

  const DetailsPage({
    super.key,
    required this.imagePath,
    required this.hotelName,
    required this.hotelDescription,
    required this.hotelLocation,
    required this.rating,
    required this.pricePerNight,
    required this.imagePaths,
    required this.servicesImages,
    required this.roomTypes,
    required this.roomPrices,
    required this.localizationImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: SizedBox(
          child: MaterialButton(
            elevation: 1,
            color: Color(0xff495CF5),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingPage(),
                  ));
            },
            child: Text(
              'Book now - DZD $pricePerNight -',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Added navigation back functionality
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff495CF5),
        title: Text(
          'Details',
          style: GoogleFonts.inter(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Aligns content to the left
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagePath,
                    scale: 0.5,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    imagePaths.length,
                    (index) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imagePaths[index],
                        scale: 2.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RatingStars(
                      value: rating,
                      starCount: 5,
                      starSize: 15,
                      maxValue: 5,
                      starSpacing: 2,
                      valueLabelVisibility: false,
                      starOffColor: const Color(0xffe7e8ea),
                      starColor: Colors.yellow,
                    ),
                    Image.asset('assets/Badge.png'),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      hotelName,
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "DZD $pricePerNight",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff495CF5),
                            ),
                          ),
                          TextSpan(
                            text: " / Nuit",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.map),
                    const SizedBox(width: 8),
                    Text(
                      hotelLocation,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                _buildSectionTitle("Description"),
                Text(
                  hotelDescription,
                  style: GoogleFonts.inter(color: Colors.grey),
                ),
                const SizedBox(height: 30),
                _buildSectionTitle("Nos Services"),
                const SizedBox(height: 5),
                ...servicesImages.map(
                  (path) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Image.asset('assets/$path'),
                  ),
                ),
                const SizedBox(height: 30),
                _buildSectionTitle("Dates Disponibles"),
                const SizedBox(height: 5),
                PersistentCalendarExample(),
                const SizedBox(height: 30),
                _buildSectionTitle("Type De Chambre"),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(roomTypes.length, (index) {
                    return _buildRoomTypeButton(
                      title: roomTypes[index],
                      price: roomPrices[index],
                      color:
                          index == 1 ? const Color(0xff495CF5) : Colors.white,
                      textColor: index == 1 ? Colors.white : Colors.black,
                    );
                  }),
                ),
                _buildSectionTitle("Localisation"),
                const SizedBox(height: 16),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(localizationImagePath)),
              ],
            ),
          )),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildRoomTypeButton({
    required String title,
    required String price,
    required Color color,
    required Color textColor,
  }) {
    return Column(
      children: [
        MaterialButton(
          elevation: 1,
          color: color,
          onPressed: () {},
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
        Text(
          price,
          style: GoogleFonts.inter(color: Colors.grey),
        ),
      ],
    );
  }
}
