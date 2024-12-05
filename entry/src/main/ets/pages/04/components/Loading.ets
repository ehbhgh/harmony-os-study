@Component
struct Loading {
  @State val: number = 0
  timer: number = -1

  aboutToAppear(): void {
    this.timer = setInterval(() => {
      if (this.val < 100) {
        this.val++
      }
    }, 10)
  }

  aboutToDisappear(): void {
    clearInterval(this.timer);
    this.timer = -1
  }

  build() {
    Progress({
      total: 100,
      value: this.val,
      type: ProgressType.Ring,

    }).color(Color.Blue)
  }
}

export {
  Loading
}