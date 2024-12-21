import 'package:bsc/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:bsc/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfileBloc()..add(LoadProfile()),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileInitial) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ProfileLoaded) {
                    return Stack(
                      clipBehavior:
                          Clip.none, // Allow overflow for the profile picture
                      children: [
                        // Cover Photo
                        Image.asset(
                          state.coverPic,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        // Profile Picture
                        Positioned(
                          bottom:
                              -50, // Adjust positioning to bring the picture fully into view
                          left: MediaQuery.of(context).size.width / 2 - 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              state.profilePic,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                  return const Center(child: Text('Something went wrong.'));
                },
              ),

              // Add space to ensure profile picture isn't cut off
              const SizedBox(height: 60),

              // Profile Name
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoaded) {
                    return Text(
                      state.name,
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),

              const SizedBox(height: 16),

              // Rocket Icon Section (Email)
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoaded) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/rocket.png',
                          color: const Color(0xffE76F51),
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          state.email,
                          style: GoogleFonts.inter(fontSize: 16),
                        ),
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),

              const SizedBox(height: 32),

              // Language Section
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoaded) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.language, color: Colors.grey),
                              const SizedBox(width: 8),
                              Text(
                                'Language',
                                style: GoogleFonts.inter(fontSize: 16),
                              ),
                            ],
                          ),
                          Text(
                            state.language,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),

              const Divider(height: 32, thickness: 1, color: Colors.grey),

              // Logout Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.logout_outlined, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text(
                          'Déconnecté',
                          style: GoogleFonts.inter(fontSize: 16),
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_back, color: Colors.grey),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
