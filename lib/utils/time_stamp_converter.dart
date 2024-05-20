import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampConverter implements JsonConverter<Timestamp, Object> {
  const TimestampConverter();

  @override
  Timestamp fromJson(Object json) {
    return json is Timestamp ? json : Timestamp.fromMillisecondsSinceEpoch(json as int);
  }

  @override
  Object toJson(Timestamp object) => object.millisecondsSinceEpoch;
}
