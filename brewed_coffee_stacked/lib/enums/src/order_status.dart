import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum OrderStatusEnum {
  pending(FontAwesomeIcons.truckRampBox),
  preparing(FontAwesomeIcons.clock),
  ready(FontAwesomeIcons.truckPickup),
  delivered(FontAwesomeIcons.userCheck),
  canceled(FontAwesomeIcons.rectangleXmark);

  const OrderStatusEnum(this.iconData);

  String get name => describeEnum(this);

  bool get isPending => this == OrderStatusEnum.pending;
  bool get isPreparing => this == OrderStatusEnum.preparing;
  bool get isReady => this == OrderStatusEnum.ready;
  bool get isDelivered => this == OrderStatusEnum.delivered;
  bool get isCanceled => this == OrderStatusEnum.canceled;

  final IconData iconData;
}
