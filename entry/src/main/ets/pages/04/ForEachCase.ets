import { WorkRecord,WorkRecordModel} from "./models"

@Entry
@Component
struct ForEachCase {
  @State mockData: Array<WorkRecord> = [
    {
      companyName: "Tech Solutions Inc.",
      workDate: "2023-06-15",
      workSalary: 8500,
      workTitle: "Software Engineer",
      workContent: "Developed a real-time chat application using Node.js and WebSocket."
    },
    {
      companyName: "Global Financial Corp.",
      workDate: "2022-12-01",
      workSalary: 9500,
      workTitle: "Data Analyst",
      workContent: "Analyzed market trends and provided actionable insights to optimize investments."
    },
    {
      companyName: "NextGen Robotics",
      workDate: "2021-09-20",
      workSalary: 10000,
      workTitle: "Robotics Engineer",
      workContent: "Designed and tested robotic arms for industrial automation projects."
    },
    {
      companyName: "Creative Designs Ltd.",
      workDate: "2020-03-10",
      workSalary: 7000,
      workTitle: "Graphic Designer",
      workContent: "Created visual assets for online marketing campaigns and print media."
    },
    {
      companyName: "EduTech Co.",
      workDate: "2023-01-05",
      workSalary: 6000,
      workTitle: "Content Writer",
      workContent: "Authored engaging blog posts and course materials for online learners."
    },
    {
      companyName: "Urban Planning Services",
      workDate: "2019-07-18",
      workSalary: 7800,
      workTitle: "Urban Planner",
      workContent: "Drafted city zoning plans and coordinated with stakeholders for approval."
    },
    {
      companyName: "HealthFirst Hospitals",
      workDate: "2021-11-11",
      workSalary: 5000,
      workTitle: "Administrative Assistant",
      workContent: "Managed patient records and ensured smooth operation of administrative processes."
    },
    {
      companyName: "Green Energy Solutions",
      workDate: "2022-05-27",
      workSalary: 8900,
      workTitle: "Environmental Consultant",
      workContent: "Provided sustainability solutions to reduce carbon footprint for corporate clients."
    },
    {
      companyName: "Peak Performance Sports",
      workDate: "2020-10-30",
      workSalary: 9200,
      workTitle: "Marketing Manager",
      workContent: "Led a team to promote new product launches through innovative campaigns."
    },
    {
      companyName: "Digital Horizons",
      workDate: "2023-08-15",
      workSalary: 8600,
      workTitle: "UX Designer",
      workContent: "Designed user-friendly interfaces for mobile and web applications."
    }
  ];
aboutToAppear(): void {
 this.mockData=this.mockData.map((item:WorkRecord)=>{
    return new WorkRecordModel({
      companyName:item.companyName,
      workDate:item.workDate,
      workSalary:"$"+item.workSalary,
      workTitle:item.workTitle,
      workContent:item.workContent
    })
  })
}
  build() {
    List({ space: 20 }) {
      ForEach(this.mockData, (item: WorkRecord) => {
        ListItem() {
          Column({space:10}) {
            Row() {
              Text("公司名称:").fontWeight(600)
              Text(item.companyName)
            }.justifyContent(FlexAlign.SpaceBetween).width("100%")
            Row() {
              Text("工作时间:").fontWeight(600)
              Text(item.workDate)
            }.justifyContent(FlexAlign.SpaceBetween).width("100%")
            Row() {
              Text("工作标题:").fontWeight(600)
              Text(item.workTitle)
            }.justifyContent(FlexAlign.SpaceBetween).width("100%")
            Row() {
              Text("工作内容:").fontWeight(600)
              Scroll(){
                Text(item.workContent)
              }.scrollable(ScrollDirection.Horizontal).height(40).width("90%")
            }.justifyContent(FlexAlign.SpaceBetween).width("100%")
            Row() {
              Text("工作薪资:").fontWeight(600)
              Text(item.workSalary+"").fontColor(Color.Red)
            }.justifyContent(FlexAlign.SpaceBetween).width("100%")
          }
        }
      })
    }.divider({
      color: Color.Gray,
      strokeWidth: 1
    }).padding(20)
  }
}