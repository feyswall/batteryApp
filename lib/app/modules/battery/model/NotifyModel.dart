class NotifyModel {
  String receiver_toc_id;
  String sender_toc_id;
  String type;
  String status;
  NotifyModel({
    this.sender_toc_id = '',
    this.receiver_toc_id = '',
    this.type = '',
    this.status = '',
  });

  factory NotifyModel.fromJson(Map<String, dynamic> json) => NotifyModel(
        sender_toc_id: json["sender_toc_id"],
        receiver_toc_id: json["receiver_toc_id"],
        type: json["type"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "sender_toc_id": sender_toc_id,
        "receiver_toc_id": receiver_toc_id,
        "type": type,
        "status": status,
      };

  @override
  String toString() {
    return "name: $sender_toc_id, email: $receiver_toc_id";
  }
}
