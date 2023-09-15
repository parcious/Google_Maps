// To parse this JSON data, do
//
//     final quakeModel = quakeModelFromJson(jsonString);

import 'dart:convert';

QuakeModel quakeModelFromJson(String str) => QuakeModel.fromJson(json.decode(str));

String quakeModelToJson(QuakeModel data) => json.encode(data.toJson());

class QuakeModel {
    String? type;
    Metadata? metadata;
    List<Feature>? features;
    List<double>? bbox;

    QuakeModel({
        this.type,
        this.metadata,
        this.features,
        this.bbox,
    });

    factory QuakeModel.fromJson(Map<String, dynamic> json) => QuakeModel(
        type: json["type"],
        metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
        features: json["features"] == null ? [] : List<Feature>.from(json["features"]!.map((x) => Feature.fromJson(x))),
        bbox: json["bbox"] == null ? [] : List<double>.from(json["bbox"]!.map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "metadata": metadata?.toJson(),
        "features": features == null ? [] : List<dynamic>.from(features!.map((x) => x.toJson())),
        "bbox": bbox == null ? [] : List<dynamic>.from(bbox!.map((x) => x)),
    };
}

class Feature {
    FeatureType? type;
    Properties? properties;
    Geometry? geometry;
    String? id;

    Feature({
        this.type,
        this.properties,
        this.geometry,
        this.id,
    });

    factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        type: featureTypeValues.map[json["type"]]!,
        properties: json["properties"] == null ? null : Properties.fromJson(json["properties"]),
        geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "type": featureTypeValues.reverse[type],
        "properties": properties?.toJson(),
        "geometry": geometry?.toJson(),
        "id": id,
    };
}

class Geometry {
    GeometryType? type;
    List<double>? coordinates;

    Geometry({
        this.type,
        this.coordinates,
    });

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: geometryTypeValues.map[json["type"]]!,
        coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": geometryTypeValues.reverse[type],
        "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
    };
}

enum GeometryType {
    POINT
}

final geometryTypeValues = EnumValues({
    "Point": GeometryType.POINT
});

class Properties {
    double? mag;
    String? place;
    int? time;
    int? updated;
    dynamic tz;
    String? url;
    String? detail;
    int? felt;
    double? cdi;
    double? mmi;
    String? alert;
    Status? status;
    int? tsunami;
    int? sig;
    String? net;
    String? code;
    String? ids;
    String? sources;
    String? types;
    int? nst;
    double? dmin;
    double? rms;
    int? gap;
    String? magType;
    PropertiesType? type;
    String? title;

    Properties({
        this.mag,
        this.place,
        this.time,
        this.updated,
        this.tz,
        this.url,
        this.detail,
        this.felt,
        this.cdi,
        this.mmi,
        this.alert,
        this.status,
        this.tsunami,
        this.sig,
        this.net,
        this.code,
        this.ids,
        this.sources,
        this.types,
        this.nst,
        this.dmin,
        this.rms,
        this.gap,
        this.magType,
        this.type,
        this.title,
    });

    factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        mag: json["mag"]?.toDouble(),
        place: json["place"],
        time: json["time"],
        updated: json["updated"],
        tz: json["tz"],
        url: json["url"],
        detail: json["detail"],
        felt: json["felt"],
        cdi: json["cdi"]?.toDouble(),
        mmi: json["mmi"]?.toDouble(),
        alert: json["alert"],
        status: statusValues.map[json["status"]]!,
        tsunami: json["tsunami"],
        sig: json["sig"],
        net: json["net"],
        code: json["code"],
        ids: json["ids"],
        sources: json["sources"],
        types: json["types"],
        nst: json["nst"],
        dmin: json["dmin"]?.toDouble(),
        rms: json["rms"]?.toDouble(),
        gap: json["gap"],
        magType: json["magType"],
        type: propertiesTypeValues.map[json["type"]]!,
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "mag": mag,
        "place": place,
        "time": time,
        "updated": updated,
        "tz": tz,
        "url": url,
        "detail": detail,
        "felt": felt,
        "cdi": cdi,
        "mmi": mmi,
        "alert": alert,
        "status": statusValues.reverse[status],
        "tsunami": tsunami,
        "sig": sig,
        "net": net,
        "code": code,
        "ids": ids,
        "sources": sources,
        "types": types,
        "nst": nst,
        "dmin": dmin,
        "rms": rms,
        "gap": gap,
        "magType": magType,
        "type": propertiesTypeValues.reverse[type],
        "title": title,
    };
}

enum Status {
    AUTOMATIC,
    REVIEWED
}

final statusValues = EnumValues({
    "automatic": Status.AUTOMATIC,
    "reviewed": Status.REVIEWED
});

enum PropertiesType {
    EARTHQUAKE
}

final propertiesTypeValues = EnumValues({
    "earthquake": PropertiesType.EARTHQUAKE
});

enum FeatureType {
    FEATURE
}

final featureTypeValues = EnumValues({
    "Feature": FeatureType.FEATURE
});

class Metadata {
    int? generated;
    String? url;
    String? title;
    int? status;
    String? api;
    int? count;

    Metadata({
        this.generated,
        this.url,
        this.title,
        this.status,
        this.api,
        this.count,
    });

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        generated: json["generated"],
        url: json["url"],
        title: json["title"],
        status: json["status"],
        api: json["api"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "generated": generated,
        "url": url,
        "title": title,
        "status": status,
        "api": api,
        "count": count,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
