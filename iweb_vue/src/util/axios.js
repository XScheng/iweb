import axios from 'axios';

export const axios_instance = axios.create({
  //本地的接口地址
  baseURL:'http://127.0.0.1:5050',
  //新浪云的接口地址
  // baseURL:'https://iweb0935.applinzi.com',
  headers:{
    "Content-Type":"application/x-www-form-urlencoded"
  }
});

