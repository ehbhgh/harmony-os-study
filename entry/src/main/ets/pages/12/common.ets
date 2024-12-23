export class PersonLocal{
  userName:string="王苏"
  age:number=20
}

const obj:Record<string,PersonLocal>={
  "user":new PersonLocal()
}

const local=new LocalStorage(obj)

export {local}