export interface TabBarInterface {
  icon: ResourceStr
  selectIcon: ResourceStr
  cnTitle: string
  enTitle: string
}

export class TabBarInterfaceModel implements TabBarInterface {
  icon: ResourceStr = ''
  selectIcon: ResourceStr = ''
  cnTitle: string = ''
  enTitle: string = ''

  constructor(model: TabBarInterface) {
    this.icon = model.icon
    this.selectIcon = model.selectIcon
    this.cnTitle = model.cnTitle
    this.enTitle = model.enTitle
  }
}
