'use strict';

/**
 * @param {Egg.Application} app - egg application
 */

module.exports = app => {
  const { router, controller } = app;
  router.get('/admin/index', controller.admin.main.index);
  // router.get('/admin/checkLogin', controller.admin.main.checkLogin);
  router.post('/admin/checkLogin', controller.admin.main.checkLogin);
};
