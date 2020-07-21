<template>
  <b-breadcrumb :items="items" class="bg-transparent"></b-breadcrumb>
</template>

<script>
  export default {
    name:"BreadCrumb",
    data() {
      return {
        items: [
          {
            text: '首页',
            to:{name:'home'}
          },          
          {
            text: '全部课程',
            active: true
          }
        ]
      }
    }
  }
</script>
<style scoped>
  .breadcrumb-item + .breadcrumb-item::before {
    display: inline-block;
    padding-right: 0.5rem;
    color: #6c757d;
    content: ">";
}
</style>