import "package:connectivity_plus/connectivity_plus.dart";
import "package:dio/dio.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:fluttertoast/fluttertoast.dart";
import 'dart:developer';
import "package:get/get.dart" as getX;

import "../Theme/app_color.dart";
import "../Widgets/custom_snackbar.dart";
import "../constants/app_constants.dart";
import "../utils/storage_utils.dart";

bool? isAppLive;
String source = 'None';

const String somethingWrong = "Something went wrong!";
const String responseMessage = "No response data found!";
const String interNetMessage =
    "please check your internet connection and try again latter.";
const String connectionTimeOutMessage =
    "Ops.. Server not working or might be in maintenance. Please Try Again Later";
const String authenticationMessage =
    "The session has been expired. Please log in again.";
const String tryAgain = "Try again";

int serviceCallCount = 0;

String appUrl = "http://54.184.40.199:3000/";

///Status Code with message type array or string
// 501 : sql related err
// 401: validation array
// 201 : string error
// 400 : string error
// 200: response, string/null
// 422: array
class ApiHandler {
  getX.RxBool isLoading = false.obs;

  downloadFile({
    required String url,
    required Function success,
    Function? error,
    bool? isHideLoader = true,
    bool isProgressShow = true,
  }) async {
    if (await checkInternet()) {
      if (isProgressShow) {
        showProgressDialog();
      }
    }
  }

  callAPI({
    required String apiUrl,
    dynamic params,
    Object? formValue,
    Map<String, dynamic>? header,
    dynamic onSuccess,
    Function? onError,
    ErrorMessageType errorMessageType = ErrorMessageType.snackBarOnlyError,
    MethodType methodType = MethodType.post,
    bool? isThirdPartyUrl = true,
    bool? isHideLoader = true,
    bool isProgressShow = true,
  }) async {
    String mainUrl = appUrl + apiUrl;
    if (await checkInternet()) {
      if (isProgressShow) {
        showProgressDialog();
      }

      try {
        Map<String, dynamic> headerParameters = {};

        if (kDebugMode) {
          log("APIClass Url =-> ${methodType.name.toString()} $mainUrl");
          log("APIClass params =-> $params");
        }
        String? token = getStorage(AppStrings.appToken);
        log("APIClass token =-> $token");
        if (token != null) {
          headerParameters.addAll({
            "Authorization": "Bearer $token",
            'Content-Type': 'application/json',
          });
        }

        Response response;
        final dio = Dio();

        final options = Options(headers: headerParameters);

        switch (methodType) {
          case MethodType.get:
            response = await dio.get(
              mainUrl,
              queryParameters: params,
              data: formValue,
              options: options,
            );
            break;
          case MethodType.put:
            response = await dio.put(mainUrl, data: params, options: options);
            break;
          case MethodType.patch:
            response = await dio.patch(mainUrl, data: params, options: options);
            break;
          case MethodType.delete:
            response = await dio.delete(
              mainUrl,
              data: params,
              options: options,
            );
            break;
          default:
            response = await dio.post(mainUrl, data: params, options: options);
        }
        if (kDebugMode) {
          log("APIClass statusCode =-> ${response.statusCode}");
          log("APIClass statusCode =-> ${response.data}");
        }
        if (handleResponse(response)) {
          if (kDebugMode) {
            debugPrint("APIClass response =-> ${response.data}");
          }
          if (isHideLoader!) {
            hideProgressDialog();
          }

          if (response.statusCode == 200 || response.statusCode == 201) {
            Map data =
                response.data["data"].runtimeType != List ? response.data : {};
            if (data.containsKey("data") && data["data"].containsKey("token")) {
              await setStorage(AppStrings.appToken, data["data"]["token"]);
            }
            onSuccess(response.data);
          } else {
            if (/*response.statusCode == 400 ||*/ response.statusCode == 401 ||
                response.statusCode == 403) {
              unauthorizedDialog(response.data?["message"] ?? "");
            } else if (response.statusCode == 400) {
              if (onError != null) {
                Fluttertoast.showToast(msg: response.data?["message"] ?? "");
                onError(response.data);
              }
            } else {
              showCustomSnackBar(message: response.data?["message"] ?? "");
              if (onError != null) {
                //#endregion alert
                if (kDebugMode) {
                  debugPrint("data ===error=====>${response.data?["message"]}");
                }
                onError(response.data);
              }
            }
            //endregion
          }
          isLoading.value = false;
        } else {
          if (isHideLoader!) {
            hideProgressDialog();
          }
          isLoading.value = false;
        }
        isLoading.value = false;
      } on DioException catch (dioError) {
        hideProgressDialog();
        isLoading.value = true;

        // var data = jsonDecode(dioError.response?.data);
        // Fluttertoast.showToast(msg: dioError.response?.data.toString() ?? "");
        if (dioError.response?.statusCode == 401 ||
            dioError.response?.statusCode == 400 ||
            dioError.response?.statusCode == 403 ||
            dioError.response?.statusCode == 422) {
          if (dioError.response?.statusCode == 401) {
            // logoutUser();
            // await LoginManager.refreshToken(success: (isRetry) {
            // if (isRetry) {
            // callAPI(
            // params: params,
            // apiUrl: apiUrl,
            // onSuccess: onSuccess,
            // onError: onError,
            // isProgressShow: isProgressShow,
            // methodType: methodType,
            // isHideLoader: isHideLoader);
            // });
          }
        } else {
          debugPrint("-------${dioError.message}");
          showCustomSnackBar(
            message:
                dioError.response?.data?["message"] ?? "Something want wrong",
          );
          if (kDebugMode) {
            debugPrint(
              "APIClass Exception Error : ${dioError.response?.toString()}",
            );
          }
          onError?.call(dioError.response?.data);
        }
      } catch (e) {
        //#region catch
        if (kDebugMode) {
          debugPrint("====>>>>$e");
        }
        hideProgressDialog();
        showApiErrorMessage(
          title: "Error!",
          message: e.toString(),
          isRecall: true,
          callBack: () {
            getX.Get.back();
            callAPI(
              params: params,
              apiUrl: apiUrl,
              onSuccess: onSuccess,
              onError: onError,
              isProgressShow: isProgressShow,
              methodType: methodType,
              isHideLoader: isHideLoader,
            );
          },
        );
        isLoading.value = false;
        //#endregion catch
      }
    } else {
      //#region No Internet
      showApiErrorMessage(
        title: "Error!",
        message: interNetMessage,
        isRecall: true,
        callBack: () {
          getX.Get.back();
          callAPI(
            params: params,
            apiUrl: apiUrl,
            onSuccess: onSuccess,
            onError: onError,
            isProgressShow: isProgressShow,
            methodType: methodType,
            isHideLoader: isHideLoader,
          );
        },
      );
      //#endregion No Internet
    }
  }
}

showApiErrorMessage({
  required String title,
  required String message,
  required bool isRecall,
  required Function callBack,
}) {
  serviceCallCount = 0;
  hideProgressDialog();
  apiAlertDialog(
    title: title,
    buttonTitle: serviceCallCount < 3 ? tryAgain : "Restart App",
    message: message,
    buttonCallBack: () {
      callBack();
    },
  );
}

dioErrorCall({required DioException dioError, required Function onCallBack}) {
  switch (dioError.type) {
    case DioExceptionType.unknown:
    case DioExceptionType.connectionError:
      onCallBack(dioError.message, true);
      break;
    case DioExceptionType.badResponse:
    case DioExceptionType.cancel:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
    default:
      onCallBack(dioError.message, true);
      break;
  }
}

Future<bool> checkInternet() async {
  final List<ConnectivityResult> connectivityResult =
      await (Connectivity().checkConnectivity());
  if (connectivityResult.contains(ConnectivityResult.mobile)) {
    return true;
  } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
    return true;
  } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
    return true;
  } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
    return false;
  }
  return false;
}

unauthorizedDialog(message) async {
  if (!getX.Get.isDialogOpen!) {
    getX.Get.dialog(
      WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: CupertinoAlertDialog(
          title: const Text("Onoma"),
          content: Text(message ?? authenticationMessage),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("ok".tr),
              onPressed: () {},
            ),
          ],
        ),
      ),
      barrierDismissible: false,
      transitionCurve: Curves.easeInCubic,
      transitionDuration: const Duration(milliseconds: 400),
    );
  }
}

isNotEmptyString(String? string) {
  return string != null && string.isNotEmpty;
}

bool handleResponse(Response response) {
  try {
    if (isNotEmptyString(response.toString())) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

apiAlertDialog({
  required String title,
  required String message,
  String? buttonTitle,
  Function? buttonCallBack,
  bool isShowGoBack = true,
}) async {
  if (!getX.Get.isDialogOpen!) {
    await getX.Get.dialog(
      WillPopScope(
        onWillPop: () {
          return isShowGoBack ? Future.value(true) : Future.value(false);
        },
        child: CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: isShowGoBack
              ? [
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text(
                      isNotEmptyString(buttonTitle)
                          ? (buttonTitle ?? "")
                          : "Try again",
                    ),
                    onPressed: () {
                      if (buttonCallBack != null) {
                        buttonCallBack();
                      } else {
                        getX.Get.back();
                      }
                    },
                  ),
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: const Text("Go Back"),
                    onPressed: () {
                      getX.Get.back();
                      getX.Get.back();
                    },
                  ),
                ]
              : [
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text(
                      isNotEmptyString(buttonTitle)
                          ? (buttonTitle ?? "")
                          : "Try again",
                    ),
                    onPressed: () {
                      if (buttonCallBack != null) {
                        buttonCallBack();
                      } else {
                        getX.Get.back();
                      }
                    },
                  ),
                ],
        ),
      ),
      barrierDismissible: false,
      transitionCurve: Curves.easeInCubic,
      transitionDuration: const Duration(milliseconds: 400),
    );
  }
}

enum MethodType { get, post, put, patch, delete }

enum ErrorMessageType {
  snackBarOnlyError,
  snackBarOnlySuccess,
  snackBarOnResponse,
  dialogOnlyError,
  dialogOnlySuccess,
  dialogOnResponse,
  none,
}

class ApiConfig {
  static const String loginToken = "loginToken";
  static const String onBoarding = "onBoarding";
  static const String fcmToken = "fcmToken";
  static const String devicePlatform = "DevicePlatform";
  static const String appVersion = "AppVersion";
  static const String language = "language";
  static const String baseUri = "baseUri";
  static getX.RxInt dropdownValue = 1.obs;
}

void showProgressDialog({bool isLoading = true}) {
  isLoading = true;
  getX.Get.dialog(
    const PopScope(
      canPop: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircularProgressIndicator(color: AppColor.buttonColor),
              ),
            ],
          ),
        ],
      ),
    ),
    barrierColor: Colors.black12,
    barrierDismissible: false,
  );
}

void hideProgressDialog({
  bool isLoading = true,
  bool isProgressShow = true,
  bool isHideLoader = true,
}) {
  isLoading = false;
  if ((isProgressShow || isHideLoader) && getX.Get.isDialogOpen!) {
    getX.Get.back();
  }
}
