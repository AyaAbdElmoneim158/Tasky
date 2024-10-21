// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../api/api_consumer.dart';
import '../../api/end_points.dart';
import '../constants/colors.dart';
import '../constants/images.dart';
import 'cache_helper.dart';

class AppHelperFunctions {
  static Color? getColor(String value) {
    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Yellow') {
      return Colors.yellow;
    } else if (value == 'Orange') {
      return Colors.orange;
    } else if (value == 'Brown') {
      return Colors.brown;
    } else if (value == 'Teal') {
      return Colors.teal;
    } else if (value == 'Indigo') {
      return Colors.indigo;
    }
    return null;
  }

  static void showSnackBar({
    String title = '',
    required String message,
    required BuildContext context,
    required ContentType contentType,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: title,
          message: message,
          contentType: contentType,
        ),
      ),
    );
  }

  static void showAlert({
    required String title,
    required String message,
    required BuildContext context,
    DialogType? dialogType,
    AnimType? animType,
  }) {
    AwesomeDialog(
      context: context,
      dialogType: dialogType ?? DialogType.info,
      animType: animType ?? AnimType.rightSlide,
      title: title,
      desc: message,
      btnCancelOnPress: () {},
      btnOkOnPress: () => Navigator.of(context).pop(),
    ).show();
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize(context) {
    return MediaQuery.of(context!).size;
  }

  static double screenHeight(context) {
    return MediaQuery.of(context!).size.height;
  }

  static double screenWidth(context) {
    return MediaQuery.of(context!).size.width;
  }

  static String getFormattedDate(DateTime date, {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }

  static Future<void> saveUserData({
    String? accessToken,
    String? refreshToken,
    String? userId,
    ApiConsumer? api,
  }) async {
    try {
      final storedAccessToken = await CacheHelper.getString(ApiKey.accessToken);
      if (storedAccessToken != accessToken) {
        await CacheHelper.saveData(ApiKey.accessToken, accessToken!);
      } //"access_token" : " "

      final storedRefreshToken = await CacheHelper.getString(ApiKey.refreshToken);
      if (storedRefreshToken != refreshToken) {
        await CacheHelper.saveData(ApiKey.refreshToken, refreshToken!);
      } //"refresh_token" : " "

      if (userId != null) {
        final storedUserId = await CacheHelper.getString(ApiKey.userId);
        if (storedUserId != userId) {
          await CacheHelper.saveData(ApiKey.userId, userId);
        }
      } //"user_id" : " "

      // api?.setTokenIntoHeaderAfterLogin(accessToken!); // 'Authorization': 'Bearer $token',
      // setTokenIntoHeaderAfterLogin
    } catch (e) {
      debugPrint("Error saving user data: $e");
    }
  }

  static void pickImage(
    ImageSource source,
    BuildContext context,
    dynamic addEditCubit,
  ) async {
    final ImagePicker picker = ImagePicker();

    // Function to handle image picking logic
    Future<void> pickImageFromSource(ImageSource source) async {
      try {
        final XFile? pickedImage = await picker.pickImage(source: source);
        if (pickedImage != null) {
          addEditCubit.taskImage = pickedImage;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('You have picked an image: ${pickedImage.name}'),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      } catch (e) {
        // print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error picking image'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }

    // Show options to pick image from Camera or Files
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () async {
                await pickImageFromSource(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Files'),
              onTap: () async {
                await pickImageFromSource(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  static String getRightFlagImage(String priority) {
    switch (priority) {
      case 'low':
        return AppAssets.blueFlagIcon;
      case 'high':
        return AppAssets.redFlagIcon;
      case 'medium':
        return AppAssets.purpleFlagIcon;
      default:
        return '';
    }
  }

  static Color getRightPriorityTextColor(String priority) {
    switch (priority) {
      case 'low':
        return AppColors.finishedDarkColor;
      case 'high':
        return AppColors.waitingDarkColor;
      case 'medium':
        return AppColors.onprogressDarkColor;
      default:
        return Colors.white;
    }
  }

  static Color getRightStatusContainerColor(String priority) {
    switch (priority) {
      case 'waiting':
        return AppColors.waitingDarkColor.withOpacity(0.1);
      case 'inProgress':
        return AppColors.onprogressDarkColor.withOpacity(0.1);
      case 'finished':
        return AppColors.finishedDarkColor.withOpacity(0.1);
      default:
        return Colors.white;
    }
  }

  static Color getRightPriorityContainerColor(String priority) {
    switch (priority) {
      case 'low':
        return AppColors.finishedDarkColor.withOpacity(0.1);
      case 'high':
        return AppColors.waitingDarkColor.withOpacity(0.1);
      case 'medium':
        return AppColors.onprogressDarkColor.withOpacity(0.1);
      default:
        return Colors.white;
    }
  }

  static Color getRightStatusTextColor(String priority) {
    switch (priority) {
      case 'waiting':
        return AppColors.waitingDarkColor;
      case 'inProgress':
        return AppColors.onprogressDarkColor;
      case 'finished':
        return AppColors.finishedDarkColor;
      default:
        return Colors.white;
    }
  }

  static String convertTimestampToDate(String timestamp) {
    try {
      DateTime dateTime = DateTime.parse(timestamp);

      DateFormat dateFormat = DateFormat('dd/MM/yyyy');
      String formattedDate = dateFormat.format(dateTime);

      return formattedDate;
    } catch (e) {
      if (kDebugMode) {
        print('Error parsing date: $e');
      }
      return '';
    }
  }

  static ScrollBehavior buildScrollBehavior(BuildContext context) {
    return ScrollConfiguration.of(context).copyWith(
      dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      },
    );
  }

  static String capitalizeFirstLetter(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }
}
