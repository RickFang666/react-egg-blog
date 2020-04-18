'use strict';

/**
 * @param {Egg.Application} app - egg application
 */

module.exports = app => {
  const { router, controller } = app;
  const adminauth = app.middleware.adminauth();
  router.get('/admin/index', controller.admin.main.index);
  router.get(
    '/admin/getTypeInfo',
    adminauth,
    controller.admin.main.getTypeInfo
  );
  // router.get('/admin/checkLogin', controller.admin.main.checkLogin);
  router.post('/admin/checkLogin', controller.admin.main.checkLogin);
  router.post('/admin/addArticle', adminauth, controller.admin.main.addArticle);
  router.post('/admin/updateArticle', adminauth, controller.admin.main.updateArticle);
};
