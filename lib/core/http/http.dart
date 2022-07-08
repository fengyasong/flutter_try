import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/sputils.dart';

class XHttp {
  XHttp._internal();

  ///网络请求配置
  static final Dio dio = Dio(BaseOptions(
    //baseUrl: "http://49.232.10.145:8888/",
    baseUrl: "http://localhost:8888/",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ));

  ///初始化dio
  static void init() {
    ///初始化cookie
    /*PathUtils.getDocumentsDirPath().then((value) {
      var cookieJar =
          PersistCookieJar(storage: FileStorage(value + "/.cookies/"));
      dio.interceptors.add(CookieManager(cookieJar));
    });*/

    //添加拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
      print("请求之前");
      String headers = SPUtils.getUserToken()??"";
      options.headers.addAll({'Authorization': headers});
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      print("响应之前");
      print(response);
      return handler.next(response);
    }, onError: (DioError e, handler) {
      print("错误之前");
      handleError(e);
      return handler.next(e);
    }));
  }

  ///error统一处理
  static void handleError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
        print("连接超时");
        break;
      case DioErrorType.sendTimeout:
        print("请求超时");
        break;
      case DioErrorType.receiveTimeout:
        print("响应超时");
        break;
      case DioErrorType.response:
        print("出现异常");
        break;
      case DioErrorType.cancel:
        print("请求取消");
        break;
      default:
        print("未知错误");
        break;
    }
  }

  ///get请求
  static Future get(String url, [Map<String, dynamic>? params]) async {
    Response response;
    if (params != null) {
      response = await dio.get(url, queryParameters: params);
    } else {
      response = await dio.get(url);
    }
    return response.data;
  }

  ///post 表单请求
  static Future post(String url, [Map<String, dynamic>? params]) async {
    Response response = await dio.post(url, queryParameters: params);
    return response.data;
  }

  ///post body请求
  static Future postJson(String url, [Map<String, dynamic>? data]) async {
    Response response = await dio.post(url, data: data);
    return response.data;
  }

  ///下载文件
  static Future downloadFile(urlPath, savePath) async {
    late Response response;
    try {
      response = await dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        //进度
        print("$count $total");
      });
    } on DioError catch (e) {
      handleError(e);
    }
    return response.data;
  }

  Future<Response> download(url, savePath,
      {Function(int count, int total)? onReceiveProgress, CancelToken? cancelToken}) async {

    late Response response;
    try {
      response =
      await dio.download(url, savePath, cancelToken: cancelToken, onReceiveProgress: (int count, int total) {
       print('onReceiveProgress: ${(count / total * 100).toStringAsFixed(0)} %');

        onReceiveProgress!(count, total);
      });
    } on DioError catch (e) {
      handleError(e);
    }

    return response;
  }

  /// 上传文件
  ///
  /// [path] The url path.
  /// [data] The request data
  ///
  Future<Response> uploadFile(String path, {required FormData data}) async {
    /// 打印请求相关信息：请求地址、请求方式、请求参数
    print("请求地址：【$path】");
    print('请求参数：' + data.toString());
    late Response response;
    try {
      response = await dio.post("$path", data: data, onReceiveProgress: (int count, int total) {
        print('onReceiveProgress: ${(count / total * 100).toStringAsFixed(0)} %');
      }, onSendProgress: (int count, int total) {
        print('onSendProgress: ${(count / total * 100).toStringAsFixed(0)} %');
      });

      /// 响应数据，可能已经被转换了类型, 详情请参考Options中的[ResponseType].
      print('请求成功!response.data：${response.data}');

      /// 响应头
      print('请求成功!response.headers：${response.headers}');

      /// Http status code.
      print('请求成功!response.statusCode：${response.statusCode}');
    } on DioError catch (e) {
      //print(e.response.toString());
      handleError(e);
    }

    return response;
  }
}
