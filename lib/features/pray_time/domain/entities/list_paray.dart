import 'data_time_pray.dart';
import 'list_data_pray.dart';

class ListPray {
  ListPray({this.code, this.status, this.message, this.data});

  int code;
  String status;
  String message;
  List<ListDataPray> data;

  factory ListPray.fromJson(Map<String, dynamic> json) => ListPray(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: List<ListDataPray>.from(
          json["data"].map((x) => ListDataPray.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
