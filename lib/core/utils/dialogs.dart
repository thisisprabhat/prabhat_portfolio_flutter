import 'package:flutter/material.dart';

Future<bool> showSideDialog(
    {required BuildContext context,
    required String title,
    required Widget child}) async {
  final colorScheme = Theme.of(context).colorScheme;
  return await showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            alignment: Alignment.centerRight,
            insetPadding: const EdgeInsets.all(0),
            child: Container(
              width: 500,
              height: double.maxFinite,
              color: colorScheme.surface,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          color: Colors.red,
                          icon: Icon(
                            Icons.close_rounded,
                            color: colorScheme.onSurface,
                            size: 26,
                          ),
                        )
                      ],
                    ),
                    Expanded(child: child)
                  ],
                ),
              ),
            ),
          );
        },
      ) ??
      false;
}
