let ipUrl
console.log('env:', process.env.NODE_ENV)
if(process.env.NODE_ENV === 'development') {
  ipUrl = 'http://127.0.0.1:7001/default/' 
} else {
  ipUrl = '182.61.147.53:7001/default/' 
}
const servicePath = {
  getArticleList:ipUrl + 'getArticleList' ,  //  首页文章列表接口
  getArticleById:ipUrl + 'getArticleById/',  // 文章详细页内容接口 ,需要接收参数
  getTypeInfo:ipUrl + 'getTypeInfo',         // 文章分类信息
  getListById:ipUrl + 'getListById/',         // 根据类别ID获得文章列表 
}
export default servicePath;