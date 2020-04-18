let ipUrl
console.log('env:', process.env.NODE_ENV)
if(process.env.NODE_ENV === 'development') {
  ipUrl = 'http://127.0.0.1:7001/default/' 
} else {
  ipUrl = '182.61.147.53:7001/default/' 
}
const servicePath = {
  getTypeInfo:ipUrl + 'getTypeInfo' ,  //  获得文章类别信息
  addArticle:ipUrl + 'addArticle' ,  //  添加文章
  updateArticle:ipUrl + 'updateArticle' ,  //  修改文章第api地址
  checkLogin:ipUrl + 'checkLogin' ,  //  检查用户名密码是否正确
  getArticleList:ipUrl + 'getArticleList' ,  //  文章列表 
  delArticle:ipUrl + 'delArticle/' ,  //  删除文章
  getArticleById:ipUrl + 'getArticleById/' ,  //  根据ID获得文章详情
}

export default servicePath;
