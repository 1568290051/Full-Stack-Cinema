<template>
  <div>
    <!-- 首页 -->
    <div class="box_viewpage">
      <!-- 版心 -->
      <div class="viewpage_type_area )">
        <ul class="viewpage_type_area_left all">
          <li v-for="item in ulData" :key="item.video_id" >
            <!-- 宣传照 -->
            <img :src="item.cover_path" :title="item.video_name"  class="publicity" />
            <div class="right-message">
              <!-- 标题 -->
              <div class="right-message-title">
                <div>{{item.video_name}}</div>
                <span style="color:#fe6500;font-size:12px;">HD</span>
                <br />
                <!-- 影片信息 -->
                <div class="right-information">
                  <span class="information_option" style="width:500px;">
                    <label for>主演:</label>
                    {{item.to_star}}
                  </span>
                  <br />
                  <div class="information_option">
                    <label for>类型:</label>
                    {{item.typeSort_id}}
                  </div>
                  <div class="information_option">
                    <label for>导演:</label>
                    {{item.director}}
                  </div>
                  <div class="information_option">
                    <label for>年份:</label>
                    {{item.timeSort}}
                  </div>
                  <div class="information_option">
                    <label for>时间:</label>
                    {{item.datetime}}
                  </div>
                </div>
               
              </div>
              <span class="right-information" style="width:500px;">
                <label for style="color: #999;">信息:</label>
                {{item.plot}}
              </span>
            </div>
            
          </li>
            <div class="Sudoku">
                </div>
        </ul>
       
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // 假数据
      ulData: [
        {
          video_id: "1", //视频id
          video_name: "中国机长e21e21e12e12e12e12e12e12e1", //视频名字
          cover_path:
            "https://rpg.pic-imges.com/pic/upload/vod/2019-10/201910131570938838.jpg",
          video_path: "", //视频路径
          to_star:
            "王浩信,唐诗咏,陈敏之,张颕康,张曦雯,李天翔,冯盈盈,张文慈,李国麟,苗可", //主演
          director: "王某", //导演
          typeSort_id: "1",
          timeSort: "2019", //年份
          datetime: "2019-10-2", //上线时间
          plot:
            "哈哈哈哈哈哈啊哈哈哈安静哈哈哈哈哈哈啊哈哈哈安静哈哈哈哈哈哈啊哈哈哈安静哈哈哈哈哈哈啊哈哈哈安静哈哈哈哈哈哈啊哈哈哈安静哈哈哈哈哈哈啊哈哈哈安静" //剧情
        },
         {
          video_id: "1", //视频id
          video_name: "中国机长", //视频名字
          cover_path:
            "https://rpg.pic-imges.com/pic/upload/vod/2019-10/201910071570413217.jpg",
          video_path: "", //视频路径
          to_star:
            "王浩信,唐诗咏,陈敏之,张颕康,张曦雯,李天翔,冯盈盈,张文慈,李国麟,苗可", //主演
          director: "王某", //导演
          typeSort_id: "1",
          timeSort: "2019", //年份
          datetime: "2019-10-2", //上线时间
          plot:
            "在熙攘的人类世界里，很多妖精隐匿其中，他们与人类相安无事地生活着。猫妖罗小黑因为家园被破坏，开始了它的流浪之旅。这场旅途中惺惺相惜的妖精同类与和谐包容的人类伙伴相继出现，让小黑陷入了两难抉择，究竟何处才是真正的归属？.." //剧情
        }
      ]
    }
   
  }, methods: {
      // 自循环、
      circulation(){
        let all = document.querySelectorAll('.all li')
        for(var i=0 ; i<all.length;i++){
        console.log(all[i])
        all[i].style.disolay='none'
   
        }
        
         
      }
    },created() {
      this.circulation()
    },
};



</script>
<style >
/* 轮播图 */
.box_viewpage {
  height: 350px;
  background-color: #1c1c1c;
  opacity: 0.9;
}
/* 版心 */
.viewpage_type_area {
  overflow: hidden;
  width: 1200px;
  height: 100%;
  margin: 0 auto;
  background-color: #1c1c1c;
}
ul {
  list-style: none;
}
/* 左边轮播图 */
.viewpage_type_area_left {
  position: relative;
  width: 970px;
  height: 310px;
}
.viewpage_type_area_left li {
  position: absolute;
  top: 0;
  left: 0;
  float: left;
  /* display: inline-block; */
  width: 100%;
  height: 310px;
}
/* 宣传照 */
.publicity {
  float: left;
  padding: 2px;
  border: 2px solid #3b5261;
  width: 228px;
  height: 308px;
}
/* 信息 */
.right-message {
  padding: 0 10px;
  float: left;
  width: 716px;
  height: 310px;
  background-color: #1c1c1c;
}
/* 标题 */
.right-message-title {
  color: white;
  font-weight: 400;
  font-size: 26px;
  font-family: "Microsoft Yahei";
}
/* 影片信息 */
.right-information {
  width: 500px;
  height: 100%;
  font-size: 14px;
  color: #ccc;
}
.information_option {
  margin: 10px 0;
  display: inline-block;
  line-height: 24px;
  width: 250px;
}
.information_option label {
  font-size: 14px;
  color: #999;
}
/* 右边九宫格 */
.Sudoku{
  position: absolute;
  top: 44px;
  right: -196px;
/* top: 120px;
right: 316px; */
  width: 229px;
  height: 228px;
  background-color: black;
}
.reveal{
  display: none;
}
</style>
