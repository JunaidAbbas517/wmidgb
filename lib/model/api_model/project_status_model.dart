class ProjectStatusModel {
  List<Data>? data;
  ProjectStatusModel(
      {
        this.data,
      });

  ProjectStatusModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? projectID;
  String? planStartDate;
  String? planEndDate;
  String? taskDescription;
  String? assignedTo;
  String? taskStatus;
  String? progressPercentage;
  String? notes;
  String? attachments;
  int? theschemeId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.projectID,
        this.planStartDate,
        this.planEndDate,
        this.taskDescription,
        this.assignedTo,
        this.taskStatus,
        this.progressPercentage,
        this.notes,
        this.attachments,
        this.theschemeId,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectID = json['ProjectID'];
    planStartDate = json['PlanStartDate'];
    planEndDate = json['PlanEndDate'];
    taskDescription = json['TaskDescription'];
    assignedTo = json['AssignedTo'];
    taskStatus = json['TaskStatus'];
    progressPercentage = json['ProgressPercentage'];
    notes = json['Notes'];
    attachments = json['Attachments'];
    theschemeId = json['thescheme_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['ProjectID'] = this.projectID;
    data['PlanStartDate'] = this.planStartDate;
    data['PlanEndDate'] = this.planEndDate;
    data['TaskDescription'] = this.taskDescription;
    data['AssignedTo'] = this.assignedTo;
    data['TaskStatus'] = this.taskStatus;
    data['ProgressPercentage'] = this.progressPercentage;
    data['Notes'] = this.notes;
    data['Attachments'] = this.attachments;
    data['thescheme_id'] = this.theschemeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

