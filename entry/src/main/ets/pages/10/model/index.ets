export interface UserInfoInterface{
  userInfo:string;
  avatar:string;
  mobile:string;
  email:string;
  userId:number;
  role:string

}
export class UserInfoInterfaceModel implements UserInfoInterface {
  userInfo: string = ''
  avatar: string = ''
  mobile: string = ''
  email: string = ''
  userId: number = 0
  role: string = ''

  constructor(model: UserInfoInterface) {
    this.userInfo = model.userInfo
    this.avatar = model.avatar
    this.mobile = model.mobile
    this.email = model.email
    this.userId = model.userId
    this.role = model.role
  }
}
