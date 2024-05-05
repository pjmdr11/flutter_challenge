import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final Function() callbackListener;
  final String? message;
  const CustomErrorWidget(
      {required this.callbackListener, this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey("custom_error"),
      width: double.infinity,
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 90,
            color: Theme.of(context).primaryColor,
          ),
          Text(
            message ?? "Could not complete your task at the moment!",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
          ),
          TextButton(
              onPressed: () {
                callbackListener();
              },
              child: Text(
                "Retry",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).primaryColorDark),
              ))
        ],
      ),
    );
  }
}
