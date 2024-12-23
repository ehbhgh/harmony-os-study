export interface QuestionInfo {
  id: number
  title: string
  type: string
  options: OptionItem[]
}

export interface OptionItem {
  letter: string
  optionTitle: string
}

export  interface  UserAnswer{
  questionId:number
  userAnswer:string
  userId:string
}
export class QuestionInfoModel implements QuestionInfo {
  id: number = 0
  title: string = ''
  type: string = ''
  options: OptionItem[] = []

  constructor(model: QuestionInfo) {
    this.id = model.id
    this.title = model.title
    this.type = model.type
    this.options = model.options
  }
}
export class OptionItemModel implements OptionItem {
  letter: string = ''
  optionTitle: string = ''

  constructor(model: OptionItem) {
    this.letter = model.letter
    this.optionTitle = model.optionTitle
  }
}
export class UserAnswerModel implements UserAnswer {
  questionId: number = 0
  userAnswer: string = ''
  userId: string = ''

  constructor(model: UserAnswer) {
    this.questionId = model.questionId
    this.userAnswer = model.userAnswer
    this.userId = model.userId
  }
}
