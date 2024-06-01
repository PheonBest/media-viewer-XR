'use strict';

/**
 * medium service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::medium.medium');
