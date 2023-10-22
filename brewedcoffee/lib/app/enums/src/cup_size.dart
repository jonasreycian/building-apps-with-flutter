enum CoffeeCupSizeEnum {
  small(24),
  medium(30),
  large(36);

  const CoffeeCupSizeEnum(this.size);
  final int size;

  bool get isSmall => this == CoffeeCupSizeEnum.small;
  bool get isMedium => this == CoffeeCupSizeEnum.medium;
  bool get isLarge => this == CoffeeCupSizeEnum.large;
}
