<template>
  <div>
    <b-container fluid class="px-0">
      <!-- 轮播图 -->
      <Carousel></Carousel> 
    </b-container>
      <!-- 最新课程 -->
      <HomeCourse></HomeCourse>


  </div>
</template>

<script>
import Carousel from "../components/Carousel"
import HomeCourse from "../components/HomeCourse"
export default {
  name:"Home",
  components:{
    Carousel,
    HomeCourse
  }
}
</script>

<style scoped>


</style>