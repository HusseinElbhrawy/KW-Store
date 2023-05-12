import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/media_query_values.dart';
import '../../bloc/profile_bloc.dart';

class CustomMapWidget extends StatefulWidget {
  const CustomMapWidget({super.key, required this.state});
  final ProfileState state;

  @override
  State<CustomMapWidget> createState() => _CustomMapWidgetState();
}

class _CustomMapWidgetState extends State<CustomMapWidget> {
  GoogleMapController? mapController;

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState:
          widget.state.getCurrentLocationRequestState == RequestState.loading &&
                  widget.state.locationData == null
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 500),
      firstChild: const CustomMapFirstChildWidget(),
      secondChild: widget.state.getCurrentLocationRequestState ==
                  RequestState.loaded &&
              widget.state.locationData != null
          ? Container(
              height: context.responsiveHeight(250),
              width: double.infinity,
              color: Colors.grey.shade200,
              child: Stack(
                children: [
                  GoogleMap(
                    compassEnabled: false,
                    zoomControlsEnabled: false,
                    trafficEnabled: false,
                    myLocationButtonEnabled: false,
                    myLocationEnabled: false,
                    liteModeEnabled: false,
                    buildingsEnabled: false,
                    indoorViewEnabled: false,
                    mapToolbarEnabled: false,
                    tiltGesturesEnabled: false,
                    initialCameraPosition: CameraPosition(
                      target: widget.state.locationData!,
                      zoom: 15,
                    ),
                    onTap: (argument) async {
                      context.read<ProfileBloc>().add(
                            AssignNewAddressEvent(
                              locationData: argument,
                            ),
                          );
                    },
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                    },
                    markers: {
                      Marker(
                        markerId: const MarkerId('currentLocation'),
                        position: widget.state.locationData!,
                      ),
                    },
                  ),
                  PositionedDirectional(
                    bottom: context.responsiveHeight(25),
                    end: context.responsiveHeight(25),
                    child: FloatingActionButton(
                      onPressed: () async {
                        context.read<ProfileBloc>().add(
                              AssignNewAddressEvent(
                                locationData: widget.state.currentLocationData!,
                              ),
                            );

                        mapController!.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: widget.state.currentLocationData!,
                              zoom: 50,
                              bearing: 45.0,
                              tilt: 45.0,
                            ),
                          ),
                        );
                      },
                      child: const Icon(Icons.my_location),
                    ),
                  ),
                ],
              ),
            )
          : const CustomMapFirstChildWidget(),
    );
  }
}

class CustomMapFirstChildWidget extends StatelessWidget {
  const CustomMapFirstChildWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.responsiveHeight(250),
      width: double.infinity,
      color: Colors.grey.shade200,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
