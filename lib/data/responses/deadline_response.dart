import 'package:freezed_annotation/freezed_annotation.dart';

part 'deadline_response.g.dart';

@JsonSerializable()
class DeadlineResponse {
  final DateTime start;

  final DateTime deadline;

  final bool open;

  @JsonKey(name: "server_time")
  final DateTime serverTime;

  @JsonKey(name: "has_passed")
  final bool hasPassed;

  final String remaining;

  DeadlineResponse({
    required this.start,
    required this.deadline,
    required this.open,
    required this.serverTime,
    required this.hasPassed,
    required this.remaining,
  });

  factory DeadlineResponse.fromJson(Map<String, dynamic> json) =>
      _$DeadlineResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeadlineResponseToJson(this);
}
