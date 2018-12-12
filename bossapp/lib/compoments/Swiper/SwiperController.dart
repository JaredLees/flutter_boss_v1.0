// import 'package:flutter/material.dart';

// /// A controller for [Swiper].
// ///
// /// A page controller lets you manipulate which page is visible in a [Swiper].
// /// In addition to being able to control the pixel offset of the content inside
// /// the [Swiper], a [SwiperController] also lets you control the offset in terms
// /// of pages, which are increments of the viewport size.

// class SwiperController extends ChangeNotifier {
//   SwiperController({this.initialPage = 0});

//   /// The page to show when first creating the [Swiper].
//   final int initialPage;

//   /// Current page index
//   int get index => _state._getRealIndex();

//   /// Current page index
//   double get page => _state._pageController.page;

//   /// Scroll offset
//   double get offset => _state._pageController.offset;

//   _SwiperState _swiperState;

//   _SwiperState get _state {
//     assert(_SwiperState != null,
//         "SwiperController cannot be accessed before a Swiper is built with it");
//     return _swiperState;
//   }

//   /// Start switching
//   void start() => _state.start();

//   /// Stop switching
//   void stop() => _state.stop();

//   /// Animates the controlled [Swiper] to the given page
//   ///
//   /// The animation lasts for the given duration and follows the given curve.
//   /// The returned [Future] resolves when the animation completes.
//   ///
//   /// The `duration` and `curve` arguments must not be null.
//   Future<Null> animateToPage(
//     int page, {
//     @required Duration duration,
//     @required Curve curve,
//   }) {
//     _state.animateToPage(page, duration: duration, curve: curve);
//   }

//   /// Animates the controlled [Swiper] to the next page.
//   ///
//   /// The animation lasts for the given duration and follows the given curve.
//   /// The returned [Future] resolves when the animation completes.
//   ///
//   /// The `duration` and `curve` arguments must not be null.
//   Future<Null> nextPage({@required Duration duration, @required Curve curve}) {
//     animateToPage(index + 1, duration: duration, curve: curve);
//   }

//   /// Animates the controlled [Swiper] to the previous page.
//   ///
//   /// The animation lasts for the given duration and follows the given curve.
//   /// The returned [Future] resolves when the animation completes.
//   ///
//   /// The `duration` and `curve` arguments must not be null.
//   Future<Null> previousPage(
//       {@required Duration duration, @required Curve curve}) {
//     animateToPage(index - 1, duration: duration, curve: curve);
//   }

//   void _attach(_SwiperState state) => _swiperState = state;

//   void _detach() => _swiperState = null;
// }
