<template>
  <div>
    <!-- 首页 -->
    <div class="box_viewpage">
      <!-- 版心 -->
      <div class="viewpage_type_area )">
        <ul class="viewpage_type_area_left">
          <li>132</li>
          <li>312</li>
          <li>321</li>
          <li>312</li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>
<style >
/* 轮播图 */
.box_viewpage {
  height: 350px;
  background-color: black;
  opacity: 0.9;
}
/* 版心 */
.viewpage_type_area {
  overflow: hidden;
  width: 1200px;
  height: 100%;
  margin: 0 auto;
  background-color: antiquewhite;
}
ul {
  list-style: none;
}
/* 左边轮播图 */
.viewpage_type_area_left {
  position: relative;
  width: 960px;
  height: 310px;
}
viewpage_type_area_left li {
  position: absolute;
  top: 0;
  left: 0;
  float: left;
  /* display: inline-block; */
  width: 100%;
  height: 310px;
  background-color: aqua;
}
</style>
