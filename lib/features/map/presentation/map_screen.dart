import 'package:bsc/features/map/presentation/bloc/map_bloc.dart';
import 'package:bsc/features/map/presentation/bloc/map_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
 

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MapBloc()..add(MapLoaded()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Map Screen', style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
          backgroundColor: const Color(0xff495CF5),
        ),
        body: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            if (state is MapInitial) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is MapLoadedState) {
              return MapboxMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.7749, -122.4194),
                  zoom: 10,
                ),
                onMapCreated: (controller) {
                  
                  context.read<MapBloc>().add(MapLoaded());
                },
                onCameraIdle: () {
                  final position = state.controller.cameraPosition.target;
                  context.read<MapBloc>().add(MapMove(position));
                },
                onStyleLoadedCallback: () {
                  
                },
              );
            }

            if (state is MapMovedState) {
              return MapboxMap(
                initialCameraPosition: CameraPosition(
                  target: state.newPosition,
                  zoom: 10,
                ),
                onMapCreated: (controller) {
                  context.read<MapBloc>().add(MapLoaded());
                },
              );
            }

            return Center(child: Text('Something went wrong.'));
          },
        ),
      ),
    );
  }
}
