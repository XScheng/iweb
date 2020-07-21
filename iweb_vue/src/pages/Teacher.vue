<template> 
    <b-container>   
      <b-breadcrumb :items="items" class="bg-transparent"></b-breadcrumb>   
      <b-row class="my-5" v-for="(item,index) in list" :key=index>
        <b-col lg="2" md="3" sm="4">
          <img :src="require(`../assets/images/${item.tpic}`)" class="img-fluid" alt=""/>
        </b-col>
        <b-col lg="10" md="9" sm="8">
          <h3>{{item.tname}}<span>{{item.maincourse}}</span></h3>
          <dl>
            <dt>工作经历：</dt>
            <dd>{{item.experience}}</dd>
          </dl>
          <dl>
            <dt>授课风格：</dt>
            <dd>{{item.style}}</dd>
          </dl>
        </b-col>
      </b-row>
    </b-container>    
</template>
<script>
export default {
  name:"Teacher",
  data(){
      return {
          list:[],
          items: [
          {
            text: '首页',
            to:{name:'home'}
          },          
          {
            text: '名师堂',
            active: true
          }
        ]
      }
  },
  methods:{
      getTeachers(){
          this.$axios.get("/teacher/list").then(res=>{
              if(res.data.code==200){
                  this.list = res.data.data
              }
            //   console.log(this.list)
          }).catch((err)=>{
              console.log(err)
          });
      }
  },
  mounted(){
      //组件挂载时调用getTeachers方法
      this.getTeachers();
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