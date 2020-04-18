const ipUrl = 'http://127.0.0.1:7001/admin/' 

const servicePath = {
  getTypeInfo:ipUrl + 'getTypeInfo' ,  //  获得文章类别信息
  addArticle:ipUrl + 'addArticle' ,  //  添加文章
  updateArticle:ipUrl + 'updateArticle' ,  //  修改文章第api地址
  checkLogin:ipUrl + 'checkLogin' ,  //  检查用户名密码是否正确
}

export default servicePath;
