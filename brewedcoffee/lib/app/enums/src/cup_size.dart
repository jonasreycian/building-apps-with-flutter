enum CoffeeCupSizeEnum {
  small(24),
  medium(30),
  large(36);

  const CoffeeCupSizeEnum(this.iconSize);
  final double? iconSize;

  bool get isSmall => this == CoffeeCupSizeEnum.small;
  bool get isMedium => this == CoffeeCupSizeEnum.medium;
  bool get isLarge => this == CoffeeCupSizeEnum.large;
}
