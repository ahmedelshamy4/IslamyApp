import 'package:flutter/material.dart';
import 'package:islamy_app/presentation/utils/resourses/color_manager.dart';

errorWidget() {
  return ErrorWidget.builder = ((details) {
    return Material(
      child: Container(
        color: ColorManager.primary,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/bad_request_error.png'),
                const SizedBox(height: 20.0),
                Text(
                  details.exception.toString(),
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.fade),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  });
}
