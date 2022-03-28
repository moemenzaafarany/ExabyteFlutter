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
  Map<String, dynamic>? fields;
  Map<String, File>? files;
  // Function(double progress, double speed, double estimate)? onUploading;
  // response
  late EbXhrReponse response;
  //================================================
  // constructor
  EbXhr(
    this.method,
    this.url, {
    this.headers,
    this.fields,
    this.files,
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
    if (fields != null) {
      fields!.forEach((key, value) {
        if (value is List) {
          for (dynamic val in value) {
            request!.fields['$key[]'] = val.toString();
          }
        } else {
          request!.fields[key] = value.toString();
        }
      });
    }
    // add files
    if (files != null) {
      files!.forEach((key, value) async {
        request!.files.add(await http.MultipartFile.fromPath(key, value.path));
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
