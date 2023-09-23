// ignore: camel_case_types
class resultlist {
  final String page, results;

  resultlist.fromjson(Map<String, dynamic> json)
      : page = json["page"],
        results = json["page"];
}
