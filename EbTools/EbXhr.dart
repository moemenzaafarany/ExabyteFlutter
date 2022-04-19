// Packages
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';
import 'dart:convert';

//================================================
class EbXhr {
  //================================================
  // request
  MultipartRequest? request;
  // request variables
  String method;
  String url;
  Map<String, dynamic>? headers;
  Map<String, dynamic>? data;
  // Function(double progress, double speed, double estimate)? onUploading;
  // response
  late EbXhrReponse response;
  //================================================
  // constructor
  EbXhr(
    this.method,
    this.url, {
    this.headers,
    this.data,
    //  this.onUploading,
  }) {
    // create request
    request = http.MultipartRequest(method, Uri.parse(url));
    // add headers
    request!.headers["User-Timezone"] =
        DateTime.now().timeZoneOffset.inMinutes.toString();
    if (headers != null) {
      headers!.forEach((key, value) {
        request!.headers[key] = value;
      });
    }
    // add fields
    if (data != null) {
      data!.forEach((key, value) async {
        if (data != null) {
          data.forEach((key, value) async {
            if (value is List) {
              int i = 0;
              for (dynamic val in value) {
                if (val is File) {
                  request.files
                      .add(await http.MultipartFile.fromPath('$key[$i]', val.path));
                } else {
                  request.fields['$key[$i]'] = val.toString();
                }
                i++;
              }
            } else if (value is File) {
              request.files.add(await http.MultipartFile.fromPath(key, value.path));
            } else {
              request.fields[key] = value.toString();
            }
          });
        }
      });
    }
    // callback
  }

  //================================================
  Future<EbXhrReponse> send() async {
    // request res
    http.StreamedResponse requestRes = await request!.send();

    /*
    print("my contentlength:");
    print(request!.contentLength);

    // upload ?
    int uploadTotal = request!.contentLength;
    int uploadLoaded = 0;
    int uploadStart = DateTime.now().millisecondsSinceEpoch;
    int uploadTime = 0;
    double uploadProgress = 0;
    double uploadSpeedKB = 0;
    double uploadEstimateSEC = 0;
    
    StreamTransformer<List<int>, List<int>> transformer =
        StreamTransformer.fromHandlers(
      handleData: (List<int> data, EventSink<List<int>> sink) {
        // update data
        uploadLoaded += data.length;
        uploadTime = DateTime.now().millisecondsSinceEpoch - uploadStart;
        // calc
        uploadProgress = ((uploadLoaded / uploadTotal) * 100);
        uploadSpeedKB = (uploadLoaded / uploadTime);
        uploadEstimateSEC = ((uploadTotal - uploadLoaded) / uploadSpeedKB);
        // callback
        onUploading!(uploadProgress, uploadSpeedKB, uploadEstimateSEC);
        sink.add(data);
      },
    );
    */
    String data = await requestRes.stream.bytesToString();
    response = EbXhrReponse(requestRes.statusCode,
        (requestRes.statusCode != 200 ? data : null), data);
    return response;
  }
}

//================================================
class EbXhrReponse {
  //================================================
  // request
  int httpCode;
  String? error;
  String bodyText;
  Map? bodyJson;

  // constructor
  EbXhrReponse(
    this.httpCode,
    this.error,
    this.bodyText,
  ) {
    // try to parse to json
    try {
      bodyJson = json.decode(bodyText);
    } catch (e) {
      print(e);
    }
  }
}

//================================================
class ExabyteAPIResponse {
  // api response
  final EbXhrReponse _res;
  int? status;
  String? statusCode;
  String? error;
  String? message;
  dynamic data;
  // parse data
  ExabyteAPIResponse(this._res) {
    if (_res.httpCode == 200 && _res.bodyJson != null) {
      status = _res.bodyJson!['status'];
      statusCode = _res.bodyJson!['statusCode'];
      switch (_res.bodyJson!['status']) {
        case 200:
          message = _res.bodyJson!['message'];
          data = _res.bodyJson!['data'];
          break;
        case 400:
          error = _res.bodyJson!['error'];
          data = _res.bodyJson!['data'];
          break;
        default:
          error = _res.bodyJson!['error'];
          break;
      }
    } else {
      status = _res.httpCode;
      error = _res.bodyText;
    }
  }
  // run
  run({
    Function? s200,
    Function? s400,
    Function? s401,
    Function? s403,
    Function? s404,
    Function? s500,
    Function? sdefault,
  }) {
    if (status == 200 && s200 != null) return s200();
    if (status == 400 && s400 != null) return s400();
    if (status == 401 && s401 != null) return s401();
    if (status == 403 && s403 != null) return s403();
    if (status == 404 && s404 != null) return s404();
    if (status == 500 && s500 != null) return s500();
    if (sdefault != null) return sdefault();
  }

  /*
  200 => "OK", 400 => "Bad Request", 401 => "Unauthorized", 403 => "Forbidden", 404 => "Not Found", 500 => "Internal Server Error"
  */
}

