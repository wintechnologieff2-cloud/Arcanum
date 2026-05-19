// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'dart:typed_data';

class LocalizationMap extends StatefulWidget {
  const LocalizationMap({
    super.key,
    this.width,
    this.height,
    required this.locationList,
    required this.photoUrlList,
    this.markerSize = 100.0,
    this.initialZoom = 12.0,
    this.showMyLocation = false,
  });

  final double? width;
  final double? height;
  final List<LatLng> locationList;
  final List<String> photoUrlList;
  final double markerSize;
  final double initialZoom;
  final bool showMyLocation;

  @override
  State<LocalizationMap> createState() => _LocalizationMapState();
}

class _LocalizationMapState extends State<LocalizationMap> {
  gmaps.GoogleMapController? _mapController;
  Set<gmaps.Marker> _markers = {};
  bool _isLoading = true;
  bool _initialBoundsFit = false;

  // Cache key now includes dpr so retina vs non-retina never collide
  final Map<String, gmaps.BitmapDescriptor> _iconCache = {};

  @override
  void initState() {
    super.initState();
    _buildMarkers();
  }

  @override
  void didUpdateWidget(LocalizationMap oldWidget) {
    super.didUpdateWidget(oldWidget);

    final locationsChanged = !_listEquals(
      oldWidget.locationList,
      widget.locationList,
      (a, b) => a.latitude == b.latitude && a.longitude == b.longitude,
    );
    final photosChanged = !_listEquals(
      oldWidget.photoUrlList,
      widget.photoUrlList,
      (a, b) => a == b,
    );
    final sizeChanged = oldWidget.markerSize != widget.markerSize;

    if (locationsChanged || photosChanged || sizeChanged) {
      if (locationsChanged || photosChanged) _initialBoundsFit = false;
      _buildMarkers();
    }
  }

  bool _listEquals<T>(List<T> a, List<T> b, bool Function(T, T) eq) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (!eq(a[i], b[i])) return false;
    }
    return true;
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  gmaps.LatLng _toGmaps(LatLng ff) => gmaps.LatLng(ff.latitude, ff.longitude);

  // ── Build a circular bitmap marker from a remote image URL ──────────────
  // dpr is passed in from _buildMarkers (which has context).
  Future<gmaps.BitmapDescriptor> _circularMarkerFromUrl(
      String url, double dpr) async {
    // Include dpr in cache key so a 3× screen never gets a 1× cached icon
    final cacheKey = '${url}_$dpr';
    if (_iconCache.containsKey(cacheKey)) return _iconCache[cacheKey]!;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      if (response.statusCode != 200) {
        debugPrint('[LocalizationMap] HTTP ${response.statusCode} for $url');
        return gmaps.BitmapDescriptor.defaultMarker;
      }

      // logicalSize  → what the map SDK will display (logical pixels)
      // physicalSize → what we actually draw  (sharp on hi-DPI screens)
      final double logicalSize = widget.markerSize * 1.5;
      final int physicalSize = (logicalSize * dpr).round();
      final int border = (physicalSize * 0.08).round();

      final ui.Codec codec = await ui.instantiateImageCodec(
        response.bodyBytes,
        targetWidth: physicalSize,
        targetHeight: physicalSize,
      );
      final ui.FrameInfo frame = await codec.getNextFrame();
      final ui.Image rawImage = frame.image;

      final ui.PictureRecorder recorder = ui.PictureRecorder();
      final Canvas canvas = Canvas(recorder);
      final double half = physicalSize / 2;

      // Drop shadow
      canvas.drawCircle(
        Offset(half, half + 2),
        half - 1,
        Paint()
          ..color = Colors.black.withValues(alpha: 0.25)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
      );

      // White border
      canvas.drawCircle(
          Offset(half, half), half - 1, Paint()..color = Colors.white);

      // Clip and draw photo
      canvas.clipPath(Path()
        ..addOval(Rect.fromCircle(
            center: Offset(half, half), radius: half - border - 1)));
      paintImage(
        canvas: canvas,
        rect: Rect.fromLTWH(border.toDouble(), border.toDouble(),
            physicalSize - border * 2.0, physicalSize - border * 2.0),
        image: rawImage,
        fit: BoxFit.cover,
      );

      final ui.Image composited =
          await recorder.endRecording().toImage(physicalSize, physicalSize);
      final ByteData? byteData =
          await composited.toByteData(format: ui.ImageByteFormat.png);

      if (byteData == null) return gmaps.BitmapDescriptor.defaultMarker;

      // `size` = logical display size — works in platform_interface 2.15.0
      // AND all later versions, on web + iOS + Android.
      final descriptor = gmaps.BitmapDescriptor.fromBytes(
        byteData.buffer.asUint8List(),
        size: Size(logicalSize, logicalSize),
      );

      _iconCache[cacheKey] = descriptor;
      return descriptor;
    } catch (e) {
      debugPrint('[LocalizationMap] Marker load error: $e');
      return gmaps.BitmapDescriptor.defaultMarker;
    }
  }

  // ── Build all markers concurrently ──────────────────────────────────────
  Future<void> _buildMarkers() async {
    if (!mounted) return;

    // Safe on all platforms — context is available because we check mounted.
    final double dpr =
        WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

    setState(() => _isLoading = true);

    final int count = widget.locationList.length < widget.photoUrlList.length
        ? widget.locationList.length
        : widget.photoUrlList.length;

    final List<gmaps.BitmapDescriptor> icons = await Future.wait(
      List.generate(
          count, (i) => _circularMarkerFromUrl(widget.photoUrlList[i], dpr)),
    );

    if (!mounted) return;

    final Set<gmaps.Marker> newMarkers = {};
    for (int i = 0; i < count; i++) {
      newMarkers.add(gmaps.Marker(
        markerId: gmaps.MarkerId('loc_$i'),
        position: _toGmaps(widget.locationList[i]),
        icon: icons[i],
        anchor: const Offset(0.5, 0.5),
        infoWindow: gmaps.InfoWindow(title: 'Location ${i + 1}'),
      ));
    }

    setState(() {
      _markers = newMarkers;
      _isLoading = false;
    });

    if (_mapController != null && newMarkers.length > 1 && !_initialBoundsFit) {
      _fitBounds();
    }
  }

  // ── Camera helpers ───────────────────────────────────────────────────────
  gmaps.LatLng get _initialTarget => widget.locationList.isNotEmpty
      ? _toGmaps(widget.locationList.first)
      : const gmaps.LatLng(0, 0);

  void _fitBounds() {
    if (widget.locationList.isEmpty) return;
    double minLat = widget.locationList.first.latitude;
    double maxLat = minLat;
    double minLng = widget.locationList.first.longitude;
    double maxLng = minLng;

    for (final ll in widget.locationList) {
      if (ll.latitude < minLat) minLat = ll.latitude;
      if (ll.latitude > maxLat) maxLat = ll.latitude;
      if (ll.longitude < minLng) minLng = ll.longitude;
      if (ll.longitude > maxLng) maxLng = ll.longitude;
    }

    _mapController?.animateCamera(
      gmaps.CameraUpdate.newLatLngBounds(
        gmaps.LatLngBounds(
          southwest: gmaps.LatLng(minLat, minLng),
          northeast: gmaps.LatLng(maxLat, maxLng),
        ),
        80.0,
      ),
    );

    _initialBoundsFit = true;
  }

  // ── Build ────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          gmaps.GoogleMap(
            initialCameraPosition: gmaps.CameraPosition(
              target: _initialTarget,
              zoom: widget.initialZoom,
            ),
            markers: _markers,
            myLocationEnabled: widget.showMyLocation,
            myLocationButtonEnabled: widget.showMyLocation,
            zoomControlsEnabled: true,
            mapToolbarEnabled: false,
            onMapCreated: (gmaps.GoogleMapController controller) {
              _mapController = controller;
              if (!_isLoading && _markers.length > 1 && !_initialBoundsFit) {
                _fitBounds();
              }
            },
          ),
          if (_isLoading)
            Positioned.fill(
              child: Container(
                color: Colors.white.withValues(alpha: 0.55),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(height: 10),
                      Text('Loading markers…',
                          style: FlutterFlowTheme.of(context).bodySmall),
                    ],
                  ),
                ),
              ),
            ),
          if (!_isLoading && _markers.isEmpty)
            Positioned.fill(
              child: Center(
                child: Text('No locations found.',
                    style: FlutterFlowTheme.of(context).bodyMedium),
              ),
            ),
        ],
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
