import { window } from '@kit.ArkUI';

@Entry
@Component
struct QQLogin_Page{
  //定义状态变量来管理组件是否显示

  @State isAccountLogin:boolean =true
  @State isOn:boolean = false
  //context 获取程序相关内容 重要信息

  aboutToAppear(): void {
    window.getLastWindow(getContext()).then((win)=>{
      win.setWindowLayoutFullScreen(true)

    })
  }

  build() {
    Column({space: 30 }){
      if(this.isAccountLogin) {
        Row() {
          Text("QQ9").blendMode(BlendMode.DST_IN, BlendApplyType.OFFSCREEN).fontSize(50)
            .fontWeight(FontWeight.Bold)
            .padding(50)
        }
        .linearGradient({
          direction: GradientDirection.Right,
          colors: [
            ["#ff4f87fe", 0.0],
            ["#dda6ff", 1.0]
          ]
        })
        .blendMode(BlendMode.SRC_OVER, BlendApplyType.OFFSCREEN)
      }  Image($r('app.media.head'))
        .width(160)
        .objectFit(ImageFit.Cover)
        .borderRadius(100)
      if(this.isAccountLogin) {
        Column({ space: 15 }) {
          TextInput({ placeholder: "输入qq号" })
            .width('80%')
            .height(50)
            .backgroundColor('#98807575')
            .borderRadius(10)
            .fontColor('#f8c2b8b8')
            .placeholderColor('#f8c2b8b8')
            .textAlign(TextAlign.Center)

          TextInput({ placeholder: "输入密码" })
            .width('80%')
            .height(50)
            .backgroundColor('#98807575')
            .borderRadius(10)
            .fontColor('#f8c2b8b8')
            .placeholderColor('#f8c2b8b8')
            .textAlign(TextAlign.Center)
            .type(InputType.NEW_PASSWORD)

        }
      }
      Row(){
        Toggle({type:ToggleType.Checkbox})
          .width(16)
          .onChange((state)=>{
            this.isOn = state
          })
        Text(){
          Span('已阅读并同意')
          Span('服务协议').fontColor('#ff4f87fe')
          Span('和')
          Span('QQ隐私保护指引').fontColor('#ff4f87fe')
        }
        .fontSize(14)
        .fontColor('#f8c2b8b8')
      }






    Button('登陆')
        .onClick(()=>{
          this.isAccountLogin=false
      })
        .width('80%')
        .fontSize('20')
        .type(ButtonType.Normal)
        .borderRadius(10)
        .height(50)
        .enabled(this.isOn)

      Flex({ justifyContent: FlexAlign.Center }) {
        Text('添加账号 |')
          .fontColor('#ff4f87fe')
        Text(' 移除账号')
          .fontColor('#ff4f87fe')
      }.padding(10)
      }.backgroundImage($r('app.media.head'))
       .backgroundImageSize(ImageSize.FILL)
       .backdropBlur(300,{grayscale:[100,1]})

      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
  }
}
