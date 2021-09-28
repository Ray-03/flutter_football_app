import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

///[OfflineCheck] to show [widgetChild] if connection found
///else show error message if connection not found

class OfflineCheck extends StatelessWidget {
  const OfflineCheck({
    Key? key,
    required this.widgetChild,
  }) : super(key: key);
  final Widget widgetChild;

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        if (connectivity == ConnectivityResult.none) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.wifi_off_outlined,
                  color: Colors.black,
                  size: 50,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Network Unavailable',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    text: 'Please check your connection and ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'try again',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return child;
        }
      },
      child: widgetChild,
    );
  }
}
