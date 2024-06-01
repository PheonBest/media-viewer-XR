'use strict';

/**
 * reader-medium service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::reader-medium.reader-medium');
